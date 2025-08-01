class AddBlackoutToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :blackout, :boolean, default: false
  end
end
