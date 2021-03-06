class PasswordResetsController < ApplicationController
  
  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    user.send_password_reset if user
    flash[:success] = "Email sent with password reset instructions."
    redirect_to root_path
  end

  def edit
    @user = User.find_by :password_reset_token => params[:id]
  end

  def update
    @user = User.find_by :password_reset_token => params[:id]
    if @user.password_reset_sent_at < 2.hours.ago
      flash[:danger] = "Password reset has expired."
      @user.delete_password_token
      redirect_to new_password_reset_path
    elsif @user.update_attributes(user_params)
      @user.delete_password_token
      flash[:success] = "Password successfully updated."
      redirect_to login_path
    else
      render 'edit'
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

end