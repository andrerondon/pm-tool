class TasksController < ApplicationController

    def create 
        @project = Project.find(params[:project_id])
        @task = Task.new task_params
        @task.project = @project
        # @task.user = current_user
        if @task.save
            redirect_to project_path(@project)
        else
            # For the list of tasks
            @tasks = @project.tasks.order(created_at: :desc)
            render 'projects/show'
        end
    end

    def destroy 
        @task = Task.find params[:id]
        if can?(:crud, @task)
            @task.destroy 
            redirect_to project_path(@task.project)
        else 
            #head will send an empty HTTP response with 
            # a particular response code, in this case
            # unauthorized 401. 
            # http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
            head :unauthorized
            # redirect_to root_path, alert: 'Not Authorized'
        end
    end


    # private 
    
    # def task_params 
    #     params.require(:task).permit(:body)
    # end





end
