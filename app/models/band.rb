class Band < ActiveRecord::Base

  has_many :band_shows
  has_many :shows, through: :band_shows

  validates :name, presence: true, length: { minimum: 1, maximum: 35 }

end