class AddConnectionFromClassToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :subjects, :course, foreign_key: true
  end
end
