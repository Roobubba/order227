class RemovePictureIdFromReleases < ActiveRecord::Migration[5.1]
  def self.up 
    remove_column :releases, :picture_id
  end
  
  def self.down
    add_column :releases, :picture_id, :integer
  end
end
