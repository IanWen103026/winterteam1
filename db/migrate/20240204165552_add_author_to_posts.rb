class AddAuthorToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :author, :string unless column_exists?(:posts, :author)
  end
end
