class RemoveHeadlinersFromShows < ActiveRecord::Migration[5.1]
  def self.up 
    remove_column :shows, :headliners
  end
  
  def self.down
    add_column :shows, :headliners, :integer
  end
end
