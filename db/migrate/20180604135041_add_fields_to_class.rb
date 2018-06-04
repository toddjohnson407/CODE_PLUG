class AddFieldsToClass < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :title, :string
    add_column :courses, :price, :integer
    add_column :courses, :rate, :string
    add_column :courses, :description, :text
    add_column :courses, :address, :string
    add_column :courses, :city, :string
    add_column :courses, :rating_average, :integer
  end
end
