class AddDocumentToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :documents, :string
  end
end
