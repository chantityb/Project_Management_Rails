class TasksController < ApplicationController
	 before_action :set_project
	
	#will define the way tasks will be created
	def create
		
		@task = @project.tasks.create(task_params)
		redirect_to @project
	end

	def destroy
		#finds task by id, using conditional creates popup message using 'flash' for confirmation
		@task = @project.tasks.find(params[:id])
		if @task.destroy
			flash[:success] = "Task was deleted."
		else
			flash[:error] = "Task was not deleted."
		end
		redirect_to @project
	end

	
	private

	#finds project by id, will run first in TasksController
	def set_project
		@project = Project.find(params[:project_id])
	end

	def task_params
		params[:task].permit(:content)
	end

end
