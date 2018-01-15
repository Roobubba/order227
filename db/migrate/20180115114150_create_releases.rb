class CreateReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :releases do |t|
      t.string :title, :url, :comments
      t.date :release_date
      t.integer :releasetype_id, :picture_id
    end
  end
end
