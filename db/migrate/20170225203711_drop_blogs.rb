class DropBlogs < ActiveRecord::Migration[5.1]
  def change
    drop_table :blogs
  end
end
