class AddCategoryToSubject < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :category, :string
  end
end
