class PagesController < ApplicationController
  
  before_action :require_admin_user, only: [:siteadmin]
    
  def home
  
  end
  
  def bio
    
  end
  
  def news
  end
  
  def music
  
  end

  def videos
  end
  
  def gallery
  end
  
  def liveshows
  end
  
  def contact
  end
  
  def siteadmin
  
  end
  

  
end