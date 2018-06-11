class AddLanguagesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :languages, :string

  end
end
