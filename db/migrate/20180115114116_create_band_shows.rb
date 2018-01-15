class CreateBandShows < ActiveRecord::Migration[5.1]
  def change
    create_table :band_shows do |t|
      t.integer :band_id, :show_id
    end
  end
end
