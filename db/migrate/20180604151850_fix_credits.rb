class FixCredits < ActiveRecord::Migration[5.2]
  def change
    remove_reference :credits, :course, foreign_key: true
    remove_reference :credits, :user, foreign_key: true
  end
end
