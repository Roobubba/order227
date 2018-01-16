class Release < ActiveRecord::Base

  validates :title, presence: true, length: { minimum: 1, maximum: 60 }
  validates :url, presence: true, length: { minimum: 1, maximum: 100 }
  validates :release_date, presence: true
  validates :releasetype_id, presence: true
end