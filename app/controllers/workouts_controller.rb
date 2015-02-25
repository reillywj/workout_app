class WorkoutsController < ApplicationController

  def new
    @cycle = Cycle.find(params[:cycle_id])
    @workout = Workout.new(cycle: @cycle, workout_date: @cycle.start_date)
  end

  def edit
  end
end