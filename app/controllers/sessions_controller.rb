class SessionsController < ApplicationController
  def new
  end

  def create
  	
  	@user = User.find_by(username: params[:username] )
  	  if @user
  		  if @user.password == params[:password]
  			 session[:user_id] = @user.id
  			 flash[:notice] = "You have been signed in."
  			 redirect_to @user
  		  else
  			 flash[:alert] = "Password does not match"
  			 redirect_to login_path
  		  end 
  	  else
  		flash[:alert] = "Username does not exist."
  		redirect_to login_path
  	  end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You have been logged out."
  	redirect_to root_path
  end
end
