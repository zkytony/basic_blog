class AddInfoForUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_index :users, :name
  end
end
