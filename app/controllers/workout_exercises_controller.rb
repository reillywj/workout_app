class WorkoutExercisesController < ApplicationController
  before_action :set_workout_exercise, only: [:edit, :update]
  def new
    @workout = Workout.find(params[:workout_id])
    @workout_exercise = WorkoutExercise.new
    @workout_exercise.workout = @workout
  end

  def create
    @workout = Workout.find(params[:workout_id])
    @workout_exercise = WorkoutExercise.new(set_params)
    @workout_exercise.workout = @workout
    if @workout_exercise.save
      flash[:success] = "Workout exercise created."
      redirect_to user_cycle_path(@workout.cycle.athlete, @workout.cycle)
    else
      flash[:alert] = "Invalid workout exercise attempt."
      render :new
    end
  end

  def edit

  end

  def update
    if @workout_exercise.update(:set_params)
      flash[:success] = "Workout exercise successfully updated."
      redirect_to user_cycle_path(@workout.cycle.athlete, @workout.cycle)
    else
      flash[:alert] = "Invalid update."
      render :edit
    end
  end

  private
  def set_params
    params.require(:workout_exercise).permit!
  end

  def set_workout_exercise
    @workout_exercise = WorkoutExercise.find(params[:id])
    @workout = @workout_exercise.workout
  end
end