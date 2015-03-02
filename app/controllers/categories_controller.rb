class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  def index
    @categories = Category.all.sort{|x,y| x.name <=> y.name}
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(set_params)
    if @category.save
      flash[:success] = "Category created."
      redirect_to category_path(@category)
    else
      flash[:alert] = "Invalid category."
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(set_params)
      flash[:success] = "Category updated."
      redirect_to category_path(@category)
    else
      flash[:alert] = "Invalid update."
      render :edit
    end
  end

  private
  def set_params
    params.require(:category).permit!
  end
  def set_category
    @category = Category.find(params[:id])
  end
end