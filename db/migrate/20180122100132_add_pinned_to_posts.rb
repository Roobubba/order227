class AddPinnedToPosts < ActiveRecord::Migration[5.1]
  def self.up 
    add_column :posts, :pinned, :boolean, default: true
  end
  
  def self.down
    remove_column :posts, :pinned
  end
end
