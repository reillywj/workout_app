class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:edit, :update]

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

  def edit; end

  def update
    if @workout.update(set_params)
      flash[:success] = "Workout updated."
      redirect_to user_cycle_path(@workout.athlete, @workout.cycle)
    else
      flash[:alert] = "Invalid update."
      render :edit
    end
  end

  private
  def set_params
    params.require(:workout).permit(:workout_date, :notes)
  end

  def set_workout
    @workout = Workout.find(params[:id])
  end
end