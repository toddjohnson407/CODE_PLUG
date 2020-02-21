class AddDocument3ToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :document_3, :string
  end
end
