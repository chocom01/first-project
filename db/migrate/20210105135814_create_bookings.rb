class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.belongs_to :user
      t.belongs_to :item
      t.datetime :start_rent_at
      t.datetime :end_rent_at
      t.timestamps
    end
  end
end
