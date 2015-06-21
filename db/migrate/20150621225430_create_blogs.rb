class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :user_id
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
