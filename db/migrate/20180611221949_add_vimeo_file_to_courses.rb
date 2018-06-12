class AddVimeoFileToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :vimeo_file, :string
  end
end
