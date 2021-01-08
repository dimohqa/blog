class FixPostTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :author, :author_id
    change_column :posts, :author_id, 'bigint USING CAST(author_id AS bigint)'
    change_column :comments, :author_id, 'bigint USING CAST(author_id AS bigint)'
  end
end
