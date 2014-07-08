class UsersController < ApplicationController
   before_action :set_user, only: [:show, :edit, :update, :destroy]
  def index
      if @user
     redirect_to posts_path
   end
  end

  def new
    @user = User.new
  
  end

  def update
     if @user.update(user_params)
      flash[:notice] = "New user updated."
      redirect_to @user
    else
      flash[:alert] = "There was a problem. Please try again."
      redirect_to user_path(@user)
    end
  end

  def edit
  end

  def show
  end

  def create
        @user = User.create(user_params)
    if @user
      flash[:notice] = "New felon created."
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:alert] = "There was a problem. Please try again."
      redirect_to new_user_path
    end
  end

  def destroy
     if @user.delete
      flash[:notice] = "Felon deleted."
      redirect_to users_path
    else
      flash[:alert] = "There was a problem"
      redirect_to users_path
    end
  end

   private

  def user_params
    params.require(:user).permit(:username, :password, :bio, :location)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
