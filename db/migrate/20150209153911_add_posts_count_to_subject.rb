class AddPostsCountToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :posts_count, :integer, :default => 0
  end
end
