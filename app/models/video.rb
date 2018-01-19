class Video < ActiveRecord::Base

  belongs_to :venue

  validates :title, presence: true, length: { minimum: 1, maximum: 40 }
  validates :url, presence: true, length: { minimum: 1, maximum: 200 }
  validates :date, presence: true
  validates :venue_id, presence: true
end