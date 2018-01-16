class Post < ActiveRecord::Base

  validates :post_text, presence: true, length: { minimum: 5, maximum: 280 }
  validates :title, presence: true, length: { minimum: 5, maximum: 50 }
  
end