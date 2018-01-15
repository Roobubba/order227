class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title, :url, :comments, :lyrics
      t.date :recorded_date
      t.integer :release_id
    end
  end
end
