class CyclesController < ApplicationController

  def show
    @cycle = Cycle.find(params[:id])
  end

  def new
    @cycle = Cycle.new
    @user = User.find(params[:user_id])
  end

  def create
    @cycle = Cycle.new(params.require(:cycle).permit(:description, :start_date, :end_date))
    @user = User.find(params[:user_id])
    @cycle.athlete = @user

    if @cycle.save
      flash[:success] = "New workout cycle successfully created."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid cycle created."
      render :new
    end
  end
end