class ChangeDefaultPinnedInPosts < ActiveRecord::Migration[5.1]
  def self.up 
    change_column :posts, :pinned, :boolean, default: false
  end
  
  def self.down
    change_column :posts, :pinned, :boolean, default: true
  end
end
