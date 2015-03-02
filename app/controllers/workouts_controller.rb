class WorkoutsController < ApplicationController

  def new
    @cycle = Cycle.find(params[:cycle_id])
    @workout = Workout.new(cycle: @cycle, workout_date: @cycle.start_date)
  end

  def create
    @cycle = Cycle.find(params[:cycle_id])
    @workout = Workout.new(set_params)
    @workout.cycle = @cycle
    if @workout.save
      flash[:success] = "Workout created."
      redirect_to user_cycle_path(@workout.athlete, @workout.cycle)
    else
      flash[:alert] = "Invalid workout."
      render :new
    end
  end

  def edit
  end

  private
  def set_params
    params.require(:workout).permit(:workout_date, :notes)
  end
end