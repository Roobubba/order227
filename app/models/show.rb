class Show < ActiveRecord::Base

  has_many :band_shows
  has_many :bands, through: :band_shows

  validates :date, presence: true
  validates :venue_id, presence: true
  validates :headliners, presence: true
  validates :picture_id, presence: true
  validates :url, presence: true, length: { minimum: 5, maximum: 100 }

end