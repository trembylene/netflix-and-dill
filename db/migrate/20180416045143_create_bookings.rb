class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.references :users, foreign_key: true
      t.references :plants, foreign_key: true
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
