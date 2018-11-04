class DashboardController < ApplicationController
	before_action :authenticate_user!
	def index
	  if current_user.manager?	
	  	@users = User.where("role_id <> 1")
	  	@todos = Todo.joins(:status_type,:user).group_by {|a| a.status_type.name}
	  	@projects = Project.where("	user_id = ?", current_user.id)
	  else
	  	@todos = Todo.joins(:project, :user).where("todos.assign_user_id = ?", current_user.id).group_by {|a| a.status_type.name}
	  	@projects = Todo.joins(:project).where("assign_user_id = ?", current_user.id).map(&:project).uniq
	  end
  end
end
