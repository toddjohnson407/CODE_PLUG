class AddCurrentPositionToUsers < ActiveRecord::Migration[5.2]
  def change
        add_column :users, :current_position, :string
  end
end
