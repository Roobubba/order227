class CreateShows < ActiveRecord::Migration[5.1]
  def change
    create_table :shows do |t|
      t.date :date
      t.integer :venue_id, :headliners, :picture_id
      t.string :url
    end
  end
end
