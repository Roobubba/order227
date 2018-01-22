class Venue < ActiveRecord::Base

  has_many :venue_shows, dependent: :destroy
  has_many :shows, through: :venue_shows, dependent: :destroy
  has_many :videos

  validates :name, presence: true, length: { minimum: 1, maximum: 35 }, uniqueness: { case_sensitive: false }
  validates :city, presence: true, length: { minimum: 1, maximum: 35 }
  validates :country, presence: true, length: { minimum: 1, maximum: 35 }

  default_scope { order('name ASC') }
  
  scope :newest_first, -> { reorder("created_at DESC") }

end