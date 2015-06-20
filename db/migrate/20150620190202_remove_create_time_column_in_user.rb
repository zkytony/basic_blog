class RemoveCreateTimeColumnInUser < ActiveRecord::Migration
  def change
    remove_column :users, :create_time
  end
end
