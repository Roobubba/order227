class CreateVenueShows < ActiveRecord::Migration[5.1]
  def change
    create_table :venue_shows do |t|
      t.integer :venue_id, :show_id
    end
  end
end
