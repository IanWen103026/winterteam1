class AddAuthorToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :author, :string
  end
end
