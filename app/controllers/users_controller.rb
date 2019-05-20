class UsersController < ApplicationController
  before_action :set_user, only: [ :edit, :update, :show, :destroy ]

  def new
    @user = User.new
  end

  def create
    #debugger
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Alpha Blog #{@user.username}"
      redirect_to articles_path
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User #{@user.username} was successfully updated"
      redirect_to articles_path
      #render :show
    else
      render :new
    end
  end

  def destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end