class PagesController < ApplicationController
  
  before_action :require_admin_user, only: [:siteadmin]
  
    
  def bio
  end
  
  def news
  end
  
  def music
    @releases = Release.all
  end

  def gallery
    @pictures = Picture.paginate(page: params[:page], per_page: 24)
  end
  
  def contact
  end
  
  def siteadmin
  end
  
end