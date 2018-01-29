class AddFbPostToPosts < ActiveRecord::Migration[5.1]
  def self.up 
    add_column :posts, :fb_post, :integer, default: 0
  end
  
  def self.down
    remove_column :posts, :fb_post
  end  
end
