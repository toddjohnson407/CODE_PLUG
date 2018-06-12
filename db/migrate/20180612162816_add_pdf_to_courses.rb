class AddPdfToCourses < ActiveRecord::Migration[5.2]
  def change
        add_column :courses, :pdf, :string

  end
end
    