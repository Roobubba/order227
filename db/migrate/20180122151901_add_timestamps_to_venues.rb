class AddTimestampsToVenues < ActiveRecord::Migration[5.1]
   def change 
    add_timestamps :venues, default: DateTime.now
    change_column_default :venues, :created_at, nil
    change_column_default :venues, :updated_at, nil
  end
  def self.down 
      remove_column :venues, :created_at
      remove_column :venues, :updated_at
  end
end
