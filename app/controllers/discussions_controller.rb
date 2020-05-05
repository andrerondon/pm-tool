class DiscussionsController < ApplicationController
    def index
        @discussions = Discussion.all.order('updated_at DESC') 
    end

    def new 
        @discussion = discussion.new 
    end

    def create
        @discussion = Discussion.new(params.require(:discussion).permit(:title, :description, :due_date))
        if @discussion.save
            redirect_to discussions_path
        else
            render :new
        end
    end

    def show
        @discussion = discussion.find(params[:id])
        @task = Task.new 
        @tasks = @discussion.tasks.order(created_at: :desc)
    end

    def destroy
        @discussion = discussion.find(params[:id])
        @discussion.destroy
        redirect_to discussions_path
    end

    def edit
        @discussion = discussion.find(params[:id])
    end

    def update
        @discussion = discussion.find(params[:id])
        if @discussion.update(params.require(:discussion).permit(:title, :description, :due_date))
            redirect_to discussion_path(@discussion)
        else
            render :edit
        end
    end

end
