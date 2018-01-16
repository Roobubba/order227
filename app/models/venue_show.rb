class VenueShow < ActiveRecord::Base

  belongs_to :venue
  belongs_to :show
  
end