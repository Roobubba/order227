class Show < ActiveRecord::Base

  has_many :band_shows, dependent: :destroy
  has_many :bands, through: :band_shows
  belongs_to :venue
  belongs_to :picture, dependent: :destroy

  validates :date, presence: true
  validates :venue_id, presence: true
  validates :picture_id, presence: true
  validates :url, length: { maximum: 100 }

end