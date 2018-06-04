class RemoveDateTime < ActiveRecord::Migration[5.2]
  def change
    remove_column :bookings, :start_date
    remove_column :bookings, :end_date
  end
end
