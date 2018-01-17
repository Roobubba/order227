class ShowsController < ApplicationController

  before_action do 
    require_user(liveshows_path)
  end
  before_action do 
    require_admin_user(liveshows_path)
  end
  
  before_action :set_show, only: [:edit, :update, :destroy, :show]
  
  def show
    @bands = @show.bands
  end

  def index
    @shows = Show.paginate(page: params[:page], per_page: 20)
  end

  def edit
    
  end
  
  def new
    @show = Show.new
  end
  
  def create
    @show = Show.new(show_params)

    if @show.save
      flash[:success] = "Show was created successfully"
      redirect_to shows_path
    else
      render 'new'
    end
  end
  
  def update
    if @show.update(show_params)
      flash[:success] = "Show details updated successfully"
      redirect_to show_path(@show)
    else
      render 'edit'
    end
  end
  
  def destroy
    Show.find(params[:id]).destroy
    flash[:success] = "Show deleted"
    redirect_to shows_path
  end

  private
    def show_params
      params.require(:show).permit(:date, :venue_id, :picture_id, :url, band_ids: [])
    end
   
    def set_show
      @show = Show.find(params[:id])
    end
end

