class PostsAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :author, :string;
  end
end
