class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:edit, :update]
  def new
    @category = Category.find(params[:category_id])
    @exercise = Exercise.new(category: @category)
  end

  def create
    @category = Category.find(params[:category_id])
    @exercise = Exercise.new(set_params)
    @exercise.category = @category
    if @exercise.save
      flash[:notice] = "Exercise created."
      redirect_to category_path(@category)
    else
      flash[:error] = "Invalid exercise."
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    if @exercise.update(set_params)
      flash[:notice] = "Exercise updated!"
      redirect_to category_path(@exercise.category)
    else
      flash[:error] = "Invalid update."
      render :edit
    end
  end

  private
  def set_params
    params.require(:exercise).permit(:name, :nickname)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end