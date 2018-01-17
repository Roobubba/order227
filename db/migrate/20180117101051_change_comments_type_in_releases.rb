class ChangeCommentsTypeInReleases < ActiveRecord::Migration[5.1]
  def self.up 
    change_column :releases, :comments, :text
  end
  
  def self.down
    change_column :releases, :comments, :string
  end
end
