class TracksController < ApplicationController
  
  before_action :require_user
  before_action :require_admin_user
  before_action :set_track, only: [:edit, :update, :destroy]
  before_action :check_for_cancel, only: [:update, :create]
  
  def index
    @tracks = Track.paginate(page: params[:page], per_page: 20)
  end
  
  def edit
    
  end
  
  def create
    @track = Track.new(track_params)

    if @track.save
      flash[:success] = "Track created successfully"
      redirect_to tracks_path
    else
      render 'new'
    end
  end
  
  def new
    @track = Track.new
  end
  
  def update
    if @track.update(track_params)
      flash[:success] = "Track details updated successfully"
      redirect_to tracks_path
    else
      render 'edit'
    end
  end

  def destroy
    Track.find(params[:id]).destroy
    flash[:success] = "Track deleted"
    redirect_to tracks_path
  end
  

  
  private
    def track_params
      params.require(:track).permit(:title, :url, :comments, :lyrics, :recorded_date, :release_id)
    end
   
    def set_track
      @track = Track.find(params[:id])
    end
    
    def check_for_cancel
      if(params.key?("cancel"))
        redirect_back(fallback_location: tracks_path)
      end
    end
    
end