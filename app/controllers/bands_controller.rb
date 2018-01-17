class BandsController < ApplicationController
  
  before_action :require_user
  before_action :require_admin_user
  before_action :set_band, only: [:edit, :update, :destroy, :show]
  before_action :check_for_cancel, only: [:update, :create]
  
  def index
    @bands = Band.paginate(page: params[:page], per_page: 20)
  end
  
  def show
    @shows = @band.shows.paginate(page: params[:page], per_page: 20)
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
      params.require(:band).permit(:name, :email, :contact_name, :url)
    end
   
    def set_band
      @band = Band.find(params[:id])
    end
    
    def check_for_cancel
      if(params.key?("cancel"))
        redirect_back(fallback_location: bands_path)
      end
    end
    
end