class ProjectsController < ApplicationController
  load_and_authorize_resource 
  
  def index
    if current_user.manager?
      @projects = Project.where("user_id = ?", current_user.id)
    else 
     @projects = Todo.joins(:project).where("assign_user_id = ?", current_user.id).map(&:project).uniq
    end
  end

  def show
  end

  
  def new
    @users = User.joins(:role).where("users.role_id <> 1").collect {|a| [a.name, a.id]}
  end

  
  def edit
  end

  
  def create
    @project.user_id = current_user.id

    respond_to do |format|
      if @project.save
        params[:user_ids] && params[:user_ids].each do |user_id|
          @project.contributors.create(user_id: user_id)
        end
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def project_params
      params.require(:project).permit(:name, :description, :user_id)
    end
end
