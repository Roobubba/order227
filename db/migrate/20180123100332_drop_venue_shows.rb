class DropVenueShows < ActiveRecord::Migration[5.1]
  def up
    drop_table :venue_shows
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
