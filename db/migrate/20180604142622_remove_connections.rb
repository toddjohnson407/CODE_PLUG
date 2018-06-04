class RemoveConnections < ActiveRecord::Migration[5.2]
  def change
    remove_reference :subjects, :course, foreign_key: true
    remove_reference :users, :course, foreign_key: true
  end
end
