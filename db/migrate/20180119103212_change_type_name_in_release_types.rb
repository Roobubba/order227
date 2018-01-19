class ChangeTypeNameInReleaseTypes < ActiveRecord::Migration[5.1]
  def self.up
    rename_column :release_types, :type, :name
  end

  def self.down
    rename_column :release_types, :name, :type
  end
end
