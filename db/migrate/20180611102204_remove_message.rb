class RemoveMessage < ActiveRecord::Migration[5.2]
  def change
    drop_table :messages do |t|
      t.text :body, :text
      t.reference :messages, :user, foreign_key: true
      t.timestamps null: false
    end
  end
end
