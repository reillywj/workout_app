class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]
  before_action :user_params, only: [:create, :update]

  def index
    @users = User.all.sort{|x,y| x.name <=> y.name}
  end

  def show; end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(user_params)
    binding.pry
    if @user.save
      flash[:notice] = "User created successfully."
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid entry."
      render :edit
    end
  end

  def edit; end

  def update
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end