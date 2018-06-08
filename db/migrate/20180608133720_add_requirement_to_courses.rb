class AddRequirementToCourses < ActiveRecord::Migration[5.2]
  def change
        add_column :courses, :requirement, :string
  end
end
