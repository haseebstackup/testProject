class TagsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_compaign
    before_action :set_tag, only: [:show, :edit, :update, :destroy]
  
    def index
      @tags = Tag.all
    end
  
    def show
    end
  
    def new
      @tag = @compaign.tags.new
    end
  
    def create
      @tag = @compaign.tags.new(tag_params)
      if @tag.save
        redirect_to @compaign, notice: 'Tag was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @tag.update(tag_params)
        redirect_to @tag, notice: 'Tag was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @tag.destroy
      redirect_to compaign_path(@compaign), notice: 'Tag was successfully destroyed.'
    end
  
    private
  
    def set_tag
      @tag = Tag.find(params[:id])
    end

    def set_compaign
        @compaign = Compaign.find(params[:compaign_id])
    end
  
    def tag_params
      params.require(:tag).permit(:name, :supertag_id)
    end
  end
  