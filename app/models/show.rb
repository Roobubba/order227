class Show < ActiveRecord::Base

  has_many :band_shows, dependent: :destroy
  has_many :bands, through: :band_shows
  
  belongs_to :venue
  accepts_nested_attributes_for :venue, reject_if: :all_blank
  
  belongs_to :picture
  accepts_nested_attributes_for :picture, reject_if: :all_blank
  
  validates :date, presence: true
  validates :venue_id, presence: true
  validates :picture_id, presence: true
  validates :url, length: { maximum: 100 }

  scope :upcoming, -> { where('date >= ?', Date.today).order(:date) }
  scope :pastshows, -> { where('date < ?', Date.today).order(date: :desc) }

  scope :nextfiveshows, -> { where('date >= ?', Date.today).order(:date).first(5) }

end