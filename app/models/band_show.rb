class BandShow < ActiveRecord::Base

  belongs_to :band
  belongs_to :show

end