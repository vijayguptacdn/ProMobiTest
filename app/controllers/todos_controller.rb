class TodosController < ApplicationController
  load_and_authorize_resource
 
  def index
    if current_user.manager?
      @todos = Todo.where('user_id = ?', current_user.id)
    else
      @todos = Todo.where('assign_user_id = ?', current_user.id)
    end
  end

  
  def show
  end

  
  def new
    @users = User.joins(:role).where("role_id <> 1").collect {|a| [a.name,a.id]}
    @projects = Project.all.collect {|p| [p.name, p.id]}
  end

  
  def edit
    @users = User.joins(:role).where("role_id <> 1").collect {|a| [a.name,a.id]}
    @projects = Project.all.collect {|p| [p.name, p.id]}
    @status_types = StatusType.all.collect {|a| [a.name, a.id]}
  end

  
  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to todos_path, notice: 'Todo was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

 
  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to todos_url, notice: 'Todo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def todo_params
      params.require(:todo).permit(:name, :description, :assign_user_id,:status_type_id, :user_id, :project_id)
    end
end
