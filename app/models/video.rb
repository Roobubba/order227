class Video < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 1, maximum: 40 }
  validates :url, presence: true, length: { minimum: 1, maximum: 200 }
  validates :venue_id, presence: true
  validates :date, presence: true

end