class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :post_text
      t.string :title
      t.integer :picture_id
      t.timestamps
    end
  end
end
