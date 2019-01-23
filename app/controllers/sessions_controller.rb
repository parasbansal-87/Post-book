class SessionsController < ApplicationController
  
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])

  		#Log the user in and redirect to the user's show page
      log_in @user

      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      
      # Rails automatically converts this to the user's profile page
      redirect_to @user 
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

  def destroy
    # if part is the fix for the first subtle bug
    log_out if logged_in?
    redirect_to root_url
  end

end
