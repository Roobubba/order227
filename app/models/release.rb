class Release < ActiveRecord::Base

  has_many :tracks, dependent: :destroy
  belongs_to :release_type, optional: true

  validates :title, presence: true, length: { minimum: 1, maximum: 60 }
  validates :url, presence: true, length: { minimum: 1, maximum: 100 }
  validates :release_date, presence: true
  validates :release_type_id, presence: true
  validates :comments, length: { maximum: 2000 }

  
  default_scope { order('release_date DESC') }

end