class AddReleaseEmbedUrlToReleases < ActiveRecord::Migration[5.1]
  def self.up 
    add_column :releases, :release_embed_url, :string
  end
  
  def self.down
    remove_column :releases, :release_embed_url
  end
end
