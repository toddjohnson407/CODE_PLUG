class FixCreditsAndCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :credits, :course, foreign_key: true
  end
end
