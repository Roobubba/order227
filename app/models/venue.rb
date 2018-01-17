class Venue < ActiveRecord::Base

  has_many :venue_shows, dependent: :destroy
  has_many :shows, through: :venue_shows, dependent: :destroy

  validates :name, presence: true, length: { minimum: 1, maximum: 35 }
  validates :city, presence: true, length: { minimum: 1, maximum: 35 }
  validates :country, presence: true, length: { minimum: 1, maximum: 35 }

end