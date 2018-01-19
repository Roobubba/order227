class ReleaseType < ActiveRecord::Base
  
  has_many :releases

  validates :name, presence: true, length: { minimum: 2, maximum: 15 }
  
end