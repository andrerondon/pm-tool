class ProjectsController < ApplicationController

    def index
        @projects = Project.all.order('updated_at DESC') 
    end

    def new 
        @project = Project.new 
    end

    def create
        @project = Project.new(params.require(:project).permit(:title, :description, :due_date))
        if @project.save
            redirect_to projects_path
        else
            render :new
        end
    end

    def show
        @project = Project.find(params[:id])
        @task = Task.new 
        @tasks = @project.tasks.order(created_at: :desc)
    end

    def destroy
        @project = Project.find(params[:id])
        @project.destroy
        redirect_to projects_path
    end

    def edit
        @project = Project.find(params[:id])
    end

    def update
        @project = Project.find(params[:id])
        if @project.update(params.require(:project).permit(:title, :description, :due_date))
            redirect_to project_path(@project)
        else
            render :edit
        end
    end

end
