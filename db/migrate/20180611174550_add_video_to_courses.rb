class AddVideoToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :video, :string
  end
end
