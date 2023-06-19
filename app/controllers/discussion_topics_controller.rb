class DiscussionTopicsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_compaign
    before_action :set_discussion_topic, only: [:show, :edit, :update, :destroy]
  
    def index
      @discussion_topics = @compaign.discussion_topics
    end
  
    def show
    end
  
    def new
      @discussion_topic = @compaign.discussion_topics.build
      authorize @discussion_topic
    end
  
    def create
      @discussion_topic = @compaign.discussion_topics.build(discussion_topic_params)
      authorize @discussion_topic
      if @discussion_topic.save
        redirect_to compaign_path(@compaign), notice: 'Discussion topic was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
      authorize @discussion_topic
    end
  
    def update
      authorize @discussion_topic
      if @discussion_topic.update(discussion_topic_params)
        redirect_to compaign_path(@compaign), notice: 'Discussion topic was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      authorize @discussion_topic
      @discussion_topic.destroy
      redirect_to compaign_path(@compaign), notice: 'Discussion topic was successfully destroyed.'
    end
  
    private
  
    def set_compaign
      @compaign = Compaign.find(params[:compaign_id])
    end
  
    def set_discussion_topic
      @discussion_topic = @compaign.discussion_topics.find(params[:id])
    end
  
    def discussion_topic_params
      params.require(:discussion_topic).permit(:title).merge(novice_id: current_user.id)
    end
  end
  