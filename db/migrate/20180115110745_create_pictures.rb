class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.string :picture
      t.string :alt_text
      t.boolean :in_gallery, default: true
      t.timestamps
    end
  end
end
