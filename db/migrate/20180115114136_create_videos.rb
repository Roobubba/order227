class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :title, :credit, :url
      t.date :date
      t.integer :venue_id
    end
  end
end
