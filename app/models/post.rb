class Post < ActiveRecord::Base
  
  belongs_to :picture, optional: true

  validates :post_text, presence: true, length: { minimum: 5, maximum: 2000 }
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  
  default_scope { order('created_at DESC') }

  scope :pinned, -> { where(pinned: true) }
  
  
end