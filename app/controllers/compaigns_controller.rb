class CompaignsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_compaign, only: [:show, :edit, :update, :destroy]
  
    def index
      @compaigns = Compaign.all
    end
  
    def show
    end
  
    def new
      @compaign = Compaign.new
      authorize @compaign
    end
  
    def create
      @compaign = Compaign.new(compaign_params)
      authorize @compaign
      if @compaign.save
        redirect_to @compaign, notice: 'Compaign was successfully created.'
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def edit
        authorize @compaign
    end
  
    def update
      authorize @compaign
      if @compaign.update(compaign_params)
        redirect_to @compaign, notice: 'Compaign was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      authorize @compaign
      @compaign.destroy
      redirect_to compaigns_path, notice: 'Compaign was successfully destroyed.'
    end

    def search
      @tag = Tag.find_by(name: params[:tag_name])
      if @tag.present?
        @compaign = @tag.compaign
        redirect_to compaign_path(@compaign)
      else
        redirect_to compaigns_path, notice: 'Tag is incorrect, Try Again'
      end
    end
  
    private
  
    def set_compaign
      @compaign = Compaign.find(params[:id])
    end
  
    def compaign_params
      params.require(:compaign).permit(:title, :purpose, :duration).merge(expert_id: current_user.id)
    end
  end
  