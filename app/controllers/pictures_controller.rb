class PicturesController < ApplicationController
  
  before_action :require_user
  before_action :require_admin_user
  
end