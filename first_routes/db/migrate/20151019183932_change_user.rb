class ChangeUser < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, null: false
    rename_column :users, :email, :username
    add_index :users, :username, unique: true

    remove_column :users, :name
  end
end
