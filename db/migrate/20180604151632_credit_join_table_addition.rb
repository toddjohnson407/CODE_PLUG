class CreditJoinTableAddition < ActiveRecord::Migration[5.2]
  def change
    add_reference :credits, :course, foreign_key: true
    add_reference :credits, :user, foreign_key: true
    add_column :credits, :available_hours, :integer
  end
end
