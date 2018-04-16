class ChangePluralNamesBookings < ActiveRecord::Migration[5.1]
  def change
    rename_column :bookings, :users_id, :user_id
    rename_column :bookings, :plants_id, :plant_id
  end
end
