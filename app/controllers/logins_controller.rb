class LoginsController < ApplicationController
  
  def new

  end
  
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      if user.email_confirmed
        session[:user_id] = user.id
        #flash[:success] = "Welcome " + user.username + ", login successful"
        redirect_to root_path
      else
        flash.now[:danger] = "Please activate your account by following the instructions in the account confirmation email"
        render 'new'
      end
    else
      flash.now[:danger] = "Your email address or password does not match"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Logout successful"
    redirect_to root_path
  end

end