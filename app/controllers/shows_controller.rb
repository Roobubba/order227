class ShowsController < ApplicationController

  before_action :set_show, only: [:edit, :update, :destroy, :show]

  before_action only: [:edit, :update, :destroy, :new, :create] do 
    require_admin_user(shows_path)
  end
  
  def show
    @bands = @show.bands
  end

  def index
    @futureshows = Show.upcoming.paginate(page: params[:page], per_page: 5)
    @pastshows = Show.pastshows.paginate(page: params[:page], per_page: 10)
  end

  def edit
    
  end
  
  def new
    @show = Show.new
    if !@show.venue_id?
      @show.build_venue
    end
    if !@show.picture_id?
      @show.build_picture
    end
  end
  
  def create
    @show = Show.new(show_params)

    if show_params[:venue_id] == ""
      venue = Venue.create(show_params[:venue_attributes])
      @show.venue = venue
    end
    if show_params[:picture_id] == ""
      picture = Picture.create(show_params[:picture_attributes])
      @show.picture = picture
    end

    if @show.save
      flash[:success] = "Show created successfully"
      redirect_to shows_path
    else
      render 'new'
    end
  end
  
  def update

    updated_params = show_params
    if show_params[:venue_id] != ""
      updated_params = show_params.except(:venue_attributes)
      @show.venue = Venue.find(show_params[:venue_id])
    else
      venue = Venue.create(show_params[:venue_attributes])
      @show.venue = venue
    end
    if show_params[:picture_id] != ""
      updated_params = updated_params.except(:picture_attributes)
      @show.picture = Picture.find(show_params[:picture_id])
    else
      picture = Picture.create(show_params[:picture_attributes])
      @show.picture = picture
    end

    
    if @show.update(updated_params)
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
      params.require(:show).permit(:date, :venue_id, :picture_id, :url, band_ids: [], venue_attributes: [:id, :name, :city, :country ], picture_attributes: [:id, :picture, :alt_text, :in_gallery])
    end
   
    def set_show
      @show = Show.find(params[:id])
    end
end

