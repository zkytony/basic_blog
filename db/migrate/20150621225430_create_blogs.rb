class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :user_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end
    # Because we expect to retrieve all the blogs by a given user_id in reverse
    # order of creation, add an index on user_id and created_at columns
    add_index :blogs, [:user_id, :created_at]
  end
end
