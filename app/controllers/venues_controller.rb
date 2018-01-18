class VenuesController < ApplicationController
  
  before_action :require_user
  before_action :require_admin_user
  before_action :set_venue, only: [:edit, :update, :destroy]
  before_action :check_for_cancel, only: [:update, :create]
  
  def index
    @venues = Venue.paginate(page: params[:page], per_page: 20)
  end
  
  def edit
    
  end
  
  def create
    @venue = Venue.new(venue_params)

    if @venue.save
      flash[:success] = "Venue created successfully"
      redirect_to venues_path
    else
      render 'new'
    end
  end
  
  def new
    @venue = Venue.new
  end
  
  def update
    if @venue.update(venue_params)
      flash[:success] = "Venue details updated successfully"
      redirect_to venues_path
    else
      render 'edit'
    end
  end

  def destroy
    Venue.find(params[:id]).destroy
    flash[:success] = "Venue deleted"
    redirect_to venues_path
  end
  

  
  private
    def venue_params
      params.require(:venue).permit(:name, :city, :country, :contact_name, :contact_detail)
    end
   
    def set_venue
      @venue = Venue.find(params[:id])
    end
    
    def check_for_cancel
      if(params.key?("cancel"))
        redirect_back(fallback_location: venues_path)
      end
    end
    
end