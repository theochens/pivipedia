class RemoveErrorsFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :rails, :string
    remove_column :posts, :g, :string
    remove_column :posts, :model, :string
    remove_column :posts, :post, :string
  end
end
