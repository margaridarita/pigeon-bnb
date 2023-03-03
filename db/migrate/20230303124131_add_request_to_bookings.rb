class AddRequestToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :request, :text
  end
end
