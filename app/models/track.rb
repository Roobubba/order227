class Track < ActiveRecord::Base

  belongs_to :release

  validates :title, presence: true, length: { minimum: 2, maximum: 40 }
  validates :url, presence: true, length: { minimum: 5, maximum: 100 }
  validates :lyrics, presence: true, length: { minimum: 5, maximum: 5000 }
  validates :comments, presence: true, length: { minimum: 5, maximum: 200 }
  validates :recorded_date, presence: true
  validates :release_id, presence: true
  
end