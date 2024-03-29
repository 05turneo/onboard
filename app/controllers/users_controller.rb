class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)

  	if @user.save
  		flash[:success] = "Sign up successful"

  		#Tell the browser about user with sessions
  		session[:user_id] = @user.id
  		redirect_to root_path

  	else
  		render :new

  	end	
  end

  #Whitelist the users input from the form

  def user_params
  	params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end

end
