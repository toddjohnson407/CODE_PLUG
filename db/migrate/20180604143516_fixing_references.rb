class FixingReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :subject, foreign_key: true
    add_reference :courses, :user, foreign_key: true
  end
end
