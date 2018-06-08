class AddLearningToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :learning, :string

  end
end
