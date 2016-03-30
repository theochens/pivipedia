class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :rails
      t.string :g
      t.string :model
      t.string :post
      t.text :content
      t.integer :subject_id

      t.timestamps
    end
  end
end
