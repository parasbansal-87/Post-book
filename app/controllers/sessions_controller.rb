class SessionsController < ApplicationController
  
  def new
  end

  def create
  	@user = User.find_by(email: params[:session][:email].downcase)
  	if @user && @user.authenticate(params[:session][:password])

  		#Log the user in and redirect to the user's show page
      if @user.activated?
        log_in @user
        params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
        # Redirects to the stored location or user's profile page (set as default)
        redirect_back_or @user
  	  else
        message = "Account not activated."
        message += "Check your email for the activation link."
  		  flash[:warning] = message
  		  redirect_to root_url
  	  end
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
