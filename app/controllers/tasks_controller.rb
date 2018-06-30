class TasksController < ApplicationController
	 before_action :set_project
	 before_action :set_task, except: [:create]
	
	
	def create
		#will define the way tasks will be created
		@task = @project.tasks.create(task_params)
		redirect_to @project
	end

	def destroy
		#using conditional creates popup message using 'flash' for confirmation
		if @task.destroy
			flash[:success] = "Task was deleted."
		else
			flash[:error] = "Task was not deleted."
		end
		redirect_to @project
	end

	def complete
		@task.update_attribute(:completed_at, Time.now)
		redirect_to @project, notice: "Task Completed"
	end

	
	private

	#finds project by id, will run first in TasksController
	def set_project
		@project = Project.find(params[:project_id])
	end

	def set_task
		#finds task by id
		@task = @project.tasks.find(params[:id])
	end

	def task_params
		params[:task].permit(:content)
	end

end
