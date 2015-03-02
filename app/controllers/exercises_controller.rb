class ExercisesController < ApplicationController
  before_action :set_exercise, only: [:edit, :update]
  def new
    @subcategory = Subcategory.find(params[:subcategory_id])
    @exercise = Exercise.new(subcategory: @subcategory)
  end

  def create
    @subcategory = Subcategory.find(params[:subcategory_id])
    @exercise = Exercise.new(set_params)
    @exercise.subcategory = @subcategory
    if @exercise.save
      flash[:success] = "Exercise created."
      redirect_to category_path(@subcategory.category)
    else
      flash[:alert] = "Invalid exercise."
      render :new
    end
  end

  def edit
    @exercise = Exercise.find(params[:id])
  end

  def update
    if @exercise.update(set_params)
      flash[:success] = "Exercise updated!"
      redirect_to category_path(@exercise.subcategory.category)
    else
      flash[:alert] = "Invalid update."
      render :edit
    end
  end

  private
  def set_params
    params.require(:exercise).permit(:name, :nickname, :subcategory_id)
  end

  def set_exercise
    @exercise = Exercise.find(params[:id])
  end
end