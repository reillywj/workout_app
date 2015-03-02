class GoalsController < ApplicationController
  before_action :context, only: [:create, :edit, :update, :destroy]

  def create
    @goal = Goal.new(goal_params)
    @goal.visibility = true
    @goal.status = "active"
    if @goal.save
      @goal.goalable = @context
      @goal.save
      flash[:success] = "Goal added."
      redirect_to context_url(context)
    else
      flash[:alert] = "Invalid goal."
      redirect_to context_url(context)
    end
  end

  def destroy
    binding.pry
    Goal.find(params[:id]).delete
    redirect_to user_path(@context)
  end

  private
  def goal_params
    params.require(:goal).permit(:description)
  end

  def context
    @context = if params[:cycle_id]
      Cycle.find(params[:cycle_id])
    elsif params[:user_id]
      User.find(params[:user_id])
    end
  end

  def context_url(context)
    if User === context
      user_path(context)
    else
      user_cycle_path(context)
    end
  end
end