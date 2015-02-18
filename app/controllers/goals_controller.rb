class GoalsController < ApplicationController
  before_action :context, only: [:create, :edit, :update]

  def create
    binding.pry
    @goal = Goal.new(goal_params)
    if @goal.save
      @goal.goalable = @context
      @goal.save
      flash[:notice] = "Goal added."
      redirect_to context_url(context)
    else
      flash[:error] = "Invalid goal."
      redirect_to context_url(context)
    end
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