class Post < ActiveRecord::Base

  belongs_to :picture, optional: true
  accepts_nested_attributes_for :picture, reject_if: :all_blank
  
  validates :post_text, presence: true, length: { minimum: 5, maximum: 2000 }
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  
  default_scope { order('updated_at DESC') }
  
end