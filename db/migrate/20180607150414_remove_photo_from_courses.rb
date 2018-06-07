class RemovePhotoFromCourses < ActiveRecord::Migration[5.2]
  def change
    remove_column :courses, :photo, :string
  end
end
