class VideosController < ApplicationController
  
  before_action :set_video, only: [:edit, :update, :destroy, :show]

  before_action only: [:edit, :update, :destroy, :new, :create] do 
    require_admin_user(videos_path)
  end
  
  before_action :check_for_cancel, only: [:update, :create]
  
  def index
    @videos = Video.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
    
  end
  
  def show
  
  end
  
  def create
    @video = Video.new(video_params)

    if @video.save
      flash[:success] = "Video created successfully"
      redirect_to videos_path
    else
      render 'new'
    end
  end
  
  def new
    @video = Video.new
  end
  
  def update
    if @video.update(video_params)
      flash[:success] = "Video details updated successfully"
      redirect_to videos_path
    else
      render 'edit'
    end
  end

  def destroy
    Video.find(params[:id]).destroy
    flash[:success] = "Video deleted"
    redirect_to videos_path
  end
  

  
  private
    def video_params
      params.require(:video).permit(:title, :credit, :url, :date, :venue_id)
    end
   
    def set_video
      @video = Video.find(params[:id])
    end
    
    def check_for_cancel
      if(params.key?("cancel"))
        redirect_back(fallback_location: videos_path)
      end
    end
    
end