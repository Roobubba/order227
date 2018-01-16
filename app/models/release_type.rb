class ReleaseType < ActiveRecord::Base

  validates :type, presence: true, length: { minimum: 2, maximum: 15 }
  
end