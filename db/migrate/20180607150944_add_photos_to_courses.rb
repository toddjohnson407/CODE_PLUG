class AddPhotosToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :photo, :string
  end
end
