class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :courses, :documents, :document_1
    rename_column :courses, :pdf, :document_2
  end
end
