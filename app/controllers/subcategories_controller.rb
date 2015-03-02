class SubcategoriesController < ApplicationController
  before_action :set_subcategory, only: [:edit, :update]
  def new
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new(category: @category)
  end

  def create
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.new(set_params)
    @subcategory.category = @category

    if @subcategory.save
      flash[:success] = "Subcategory created."
      redirect_to category_path(@category)
    else
      flash[:alert] = "Invalid subcategory."
      render :new
    end
  end

  def edit
    @subcategory = Subcategory.find(params[:id])
  end

  def update
    if @subcategory.update(set_params)
      flash[:success] = "Subcategory updated!"
      redirect_to category_path(@subcategory.category)
    else
      flash[:alert] = "Invalid update."
      render :edit
    end
    
  end

  private
  def set_params
    params.require(:subcategory).permit!
  end

  def set_subcategory
    @subcategory = Subcategory.find(params[:id])
  end
end