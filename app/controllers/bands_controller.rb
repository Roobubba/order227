class BandsController < ApplicationController
  
  before_action :require_user
  before_action :require_admin_user
  before_action :set_band, only: [:edit, :update, :show, :destroy]
  
  def index
    @bands = Band.paginate(page: params[:page], per_page: 25)
  end

  def show

  end

  def edit
    
  end
  
  def create
    @band = Band.new(band_params)

    if @band.save
      flash[:success] = "Band was created successfully"
      redirect_to bands_path
    else
      render 'new'
    end
  end
  
  def new
    @band = Band.new
  end
  
  def update
    if @band.update(band_params)
      flash[:success] = "Band details updated successfully"
      redirect_to band_path(@band)
    else
      render 'edit'
    end
  end

  def destroy
    Band.find(params[:id]).destroy
    flash[:success] = "Band deleted"
    redirect_to bands_path
  end
  
  private
    def band_params
      params.require(:user).permit(:name, :email, :contact_name, :url, show_ids: [])
    end
   
    def set_band
      @band = Band.find(params[:id])
    end
  
end