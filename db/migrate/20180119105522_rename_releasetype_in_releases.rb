class RenameReleasetypeInReleases < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :releases, :releasetype_id, :release_type_id
  end

  def self.down
    rename_column :releases, :release_type_id, :releasetype_id
  end
end
