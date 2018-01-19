class RemoveShowIdFromPictures < ActiveRecord::Migration[5.1]
  def self.up 
    remove_column :pictures, :show_id
  end
  
  def self.down
    add_column :pictures, :show_id, :integer
  end
end
