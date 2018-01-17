class ChangePostTextTypeInPosts < ActiveRecord::Migration[5.1]
  def self.up 
    change_column :posts, :post_text, :text
  end
  
  def self.down
    change_column :posts, :post_text, :string
  end
end
