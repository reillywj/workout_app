class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :user_params, only: [:create, :update]

  def index
    @users = User.all.sort{|x,y| x.name <=> y.name}
  end

  def show
    @goal = Goal.new(goalable: @user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created successfully."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid entry."
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:success] = "User profile updated successfully."
      redirect_to user_path(@user)
    else
      flash[:alert] = "Invalid entry."
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    # params.require(:user).permit(:name, :email, :password, :role)
    params.require(:user).permit!
  end
end