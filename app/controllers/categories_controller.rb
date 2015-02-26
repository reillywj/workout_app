class CategoriesController < ApplicationController
  def index
    @categories = Category.all.sort{|x,y| x.name <=> y.name}
  end

  def show
    @category = Category.find(params[:id])
  end
end