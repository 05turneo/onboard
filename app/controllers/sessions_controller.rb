class SessionsController < ApplicationController
  	
  	#this doesnt need a variable because its a placeholder form
  def new
  end

  def create
  	#find the username and password from the form
  	#then check if theres a user with that username
  	#and if they have the same password as what was typed in, give them a session

  	@username = params[:session][:username]
  	@password = params[:session][:password]

  	@user = User.find_by_username(@username)

  	if @user.present? and @user.authenticate(@password)

  		#give the motherfuckers a session
  		session[:user_id] = @user.id
  		flash[:success] = "Welcome #[@user.name]"
  		redirect_to root_path

  	else 
  		flash[:error] = "login failed :("
  		render :new

  	end

  end


  def destroy
  	#remove session[:user_id]
  	reset_session
  	flash[:success] = "You're logged out"
  	redirect_to root_path
  end


end
