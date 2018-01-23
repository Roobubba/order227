class AddPicSha1ToPictures < ActiveRecord::Migration[5.1]
  def self.up 
    add_column :pictures, :pic_sha1, :string
  end
  
  def self.down
    remove_column :pictures, :pic_sha1
  end  
end
