class FixTeacher < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :teacher
    add_column :users, :teacher, :boolean, default: false
  end
end
