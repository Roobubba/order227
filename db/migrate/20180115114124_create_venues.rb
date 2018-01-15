class CreateVenues < ActiveRecord::Migration[5.1]
  def change
    create_table :venues do |t|
      t.string :name, :city, :country, :contact_name, :contact_detail
    end
  end
end
