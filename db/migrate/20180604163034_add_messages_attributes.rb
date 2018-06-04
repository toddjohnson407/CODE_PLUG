class AddMessagesAttributes < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :body, :text
    add_reference :messages, :user, foreign_key: true
  end
end
