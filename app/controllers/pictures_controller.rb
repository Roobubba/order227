class PicturesController < ApplicationController
  
  before_action :set_picture, only: [:edit, :update, :destroy]
  before_action :require_admin_user
  before_action :check_for_cancel, only: [:update, :create, :createmodal]
  
  def index
    @pictures = Picture.paginate(page: params[:page], per_page: 10)
   #Picture.all.each { |i| i.picture.recreate_versions! }
  
  end

  def edit
    
  end
  
  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      flash[:success] = "Picture was created successfully"
      redirect_to pictures_path
    else
      render 'new'
    end
  end

  
  def new
    @picture = Picture.new
  end

  def update
    if @picture.update(picture_params)
      flash[:success] = "Picture details updated successfully"
      redirect_to pictures_path
    else
      render 'edit'
    end
  end

  def destroy
    Picture.find(params[:id]).destroy
    flash[:success] = "Picture deleted"
    redirect_to pictures_path
  end
  
  private
    def picture_params
      params.require(:picture).permit(:picture, :alt_text, :in_gallery)
    end
   
    def set_picture
      @picture = Picture.find(params[:id])
    end
    
    def check_for_cancel
      if(params.key?("cancel"))
        redirect_back(fallback_location: pictures_path)
      end
    end
    
end