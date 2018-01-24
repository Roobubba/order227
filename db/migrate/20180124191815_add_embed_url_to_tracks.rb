class AddEmbedUrlToTracks < ActiveRecord::Migration[5.1]
  def self.up 
    add_column :tracks, :embed_url, :string
  end
  
  def self.down
    remove_column :tracks, :embed_url
  end
end
