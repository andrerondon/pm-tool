class CommentsController < ApplicationController

    def create 
        @discussion = Discussion.find(params[:discussion_id])
        @comment = comment.new comment_params
        @comment.discussion = @discussion
        # @comment.user = current_user
        if @comment.save
            redirect_to project_path(@projetc)
        else
            # For the list of comments
            @comments = @discussion.comments.order(created_at: :desc)
            render 'projects/show'
        end
    end

    def destroy 
        @comment = Comment.find params[:id]
        if @comment
            @comment.destroy 
            redirect_to projects_path(@project)
        else 
            #head will send an empty HTTP response with 
            # a particular response code, in this case
            # unauthorized 401. 
            # http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
            head :unauthorized
            # redirect_to root_path, alert: 'Not Authorized'
        end
    end
end
