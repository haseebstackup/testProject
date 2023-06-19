class ToDosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_compaign
  before_action :set_todo, only: [:edit, :update, :destroy]

  def new
    @todo = @compaign.to_dos.build
  end

  def create
    @todo = @compaign.to_dos.build(to_do_params)
    if @todo.save
      redirect_to @compaign, notice: 'Todo was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @todo.update(to_do_params)
      redirect_to @compaign, notice: 'Todo was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
    redirect_to @compaign, notice: 'Todo was successfully destroyed.'
  end

  private

  def set_compaign
    @compaign = Compaign.find(params[:compaign_id])
  end

  def set_todo
    @todo = @compaign.to_dos.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit(:task, :status)
  end
end
