class AddCreditHours < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :hours, :integer
  end
end
