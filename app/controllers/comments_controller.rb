class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_commentable
  
    def create
      @comment = @commentable.comments.new(comment_params)
      
      if @comment.save
        if @commentable.class == Compaign
          redirect_to compaign_path(@compaign), notice: 'Comment was successfully created.'
        elsif @commentable.class == DiscussionTopic
          redirect_to compaign_discussion_topic_path(@compaign,@commentable), notice: 'Comment was successfully created.'
        end
      else
        redirect_to compaign_path(@commentable), alert: 'Failed to create comment.'
      end
    end

    def destroy
      @comment = @commentable.comments.find(params[:id])
      @comment.destroy
      if @commentable.class == Compaign
        redirect_to compaign_path(@compaign), notice: 'Comment was successfully destroyed.'
      elsif @commentable.class == DiscussionTopic
        redirect_to compaign_discussion_topic_path(@compaign,@commentable), notice: 'Comment was successfully destroyed.'
      end
    end
  
    private
  
    def set_commentable
      @compaign = Compaign.find(params[:compaign_id])

      if params[:compaign_id] && !params[:discussion_topic_id]
        @commentable = Compaign.find(params[:compaign_id])
      elsif params[:discussion_topic_id]
        @commentable = DiscussionTopic.find(params[:discussion_topic_id])
      end
    end
  
    def comment_params
      params.require(:comment).permit(:title).merge(user_id: current_user.id)
    end
  end  