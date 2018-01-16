class AddPictureurlToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :picture_url, :string
  end
end
