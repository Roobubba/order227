class ReleaseTypesController < ApplicationController
  
  before_action :require_user
  before_action :require_admin_user
  before_action :set_release_type, only: [:edit, :update, :destroy]
  before_action :check_for_cancel, only: [:update, :create]
  
  def index
    @release_types = ReleaseType.all
  end
  
  def edit
    
  end
  
  def create
    @release_type = ReleaseType.new(release_type_params)

    if @release_type.save
      flash[:success] = "Release Type created successfully"
      redirect_to release_types_path
    else
      render 'new'
    end
  end
  
  def new
    @release_type = ReleaseType.new
  end
  
  def update
    if @release_type.update(release_type_params)
      flash[:success] = "Release Type details updated successfully"
      redirect_to release_types_path
    else
      render 'edit'
    end
  end

  def destroy
    ReleaseType.find(params[:id]).destroy
    flash[:success] = "Release Type deleted"
    redirect_to release_types_path
  end
  

  
  private
    def release_type_params
      params.require(:release_type).permit(:name)
    end
   
    def set_release_type
      @release_type = ReleaseType.find(params[:id])
    end
    
    def check_for_cancel
      if(params.key?("cancel"))
        redirect_back(fallback_location: release_types_path)
      end
    end
    
end