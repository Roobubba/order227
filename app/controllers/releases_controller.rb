class ReleasesController < ApplicationController
  
  before_action :set_release, only: [:edit, :update, :destroy, :show]

  before_action only: [:edit, :update, :destroy, :new, :create] do 
    require_admin_user(releases_path)
  end

  before_action :check_for_cancel, only: [:update, :create]
  
  def index
    @releases = Release.paginate(page: params[:page], per_page: 20)
  end
  
  def edit
    
  end
  
  def show 
  
  end
  
  def create
    @release = Release.new(release_params)

    if @release.save
      flash[:success] = "Release created successfully"
      redirect_to releases_path
    else
      render 'new'
    end
  end
  
  def new
    @release = Release.new
  end
  
  def update
    if @release.update(release_params)
      flash[:success] = "Release details updated successfully"
      redirect_to releases_path
    else
      render 'edit'
    end
  end

  def destroy
    Release.find(params[:id]).destroy
    flash[:success] = "Release deleted"
    redirect_to releases_path
  end
  

  
  private
    def release_params
      params.require(:release).permit(:title, :url, :comments, :release_type_id, :release_date, :release_embed_url)
    end
   
    def set_release
      @release = Release.find(params[:id])
    end
    
    def check_for_cancel
      if(params.key?("cancel"))
        redirect_back(fallback_location: releases_path)
      end
    end
    
end