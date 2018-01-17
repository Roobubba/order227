class UsersController < ApplicationController
  
  before_action :set_user, only: [:edit, :update, :destroy, :show]
  before_action :require_same_user, only: [:edit, :update, :show, :destroy, :create, :new]
  before_action :require_admin_user, only: [:index]
  
  def index
     @users = User.paginate(page: params[:page], per_page: 25)
  end
  
  def show
  
  end
  
  def edit

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Profile created successfully"
      
      if logged_in? && current_user.admin?
        redirect_to users_path and return
      end
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated successfully"
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Account deleted"
    if logged_in? && current_user.admin?
      redirect_to users_path
    else
      reset_session
      redirect_to root_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
   
    def set_user
      @user = User.find(params[:id])
    end
   
    def require_same_user
      if current_user != @user && !current_user.admin?
        flash[:danger] = "You can only edit your own profile"
         redirect_back(fallback_location: root_path)
      end
    end

    
end