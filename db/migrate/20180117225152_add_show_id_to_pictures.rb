class AddShowIdToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :show_id, :integer
  end
end
