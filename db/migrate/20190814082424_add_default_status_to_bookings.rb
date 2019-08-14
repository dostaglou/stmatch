class AddDefaultStatusToBookings < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :status, "pendinng"
  end
end
