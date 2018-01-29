class AddTwPostToPosts < ActiveRecord::Migration[5.1]
  def self.up 
    add_column :posts, :tw_post, :integer, default: 0
  end
  
  def self.down
    remove_column :posts, :tw_post
  end  
end
