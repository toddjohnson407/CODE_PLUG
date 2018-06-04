class AddReferenceInBooking < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :course, foreign_key: true
    add_reference :bookings, :user, foreign_key: true
    add_column :bookings, :start_date, :datetime
    add_column :bookings, :end_date, :datetime
  end
end
