class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_expert, only: [:update_status, :index]

  def index
    @novice_users = Novice.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(username: params[:username],email: params[:email],password: params[:password],profession: params[:profession],service: params[:service])
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'User was successfully destroyed.'
  end

  def updatestatusshow
    @user = User.find(params[:id])
  end


  def update_status
    @user = User.find(params[:id])
    @user.update(status: params[:status])
    redirect_to users_path, notice: 'User status was successfully updated.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorize_expert
    unless current_user.type == "Expert"
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end
end