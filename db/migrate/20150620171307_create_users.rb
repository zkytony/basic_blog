class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.timestamp :create_time

      t.timestamps null: false
    end
  end
end
