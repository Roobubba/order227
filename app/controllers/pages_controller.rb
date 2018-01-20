class PagesController < ApplicationController
  
  before_action :require_admin_user, only: [:siteadmin]
    
  def bio
  end
  
  def news
  end
  
  def music
    @releases = Release.all.order(release_date: :desc)
  end

  def gallery
  end
  
  def contact
  end
  
  def siteadmin
  end
  
end