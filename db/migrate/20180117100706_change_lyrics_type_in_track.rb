class ChangeLyricsTypeInTrack < ActiveRecord::Migration[5.1]
  def self.up 
    change_column :tracks, :lyrics, :text
  end
  
  def self.down
    change_column :tracks, :lyrics, :string
  end
end
