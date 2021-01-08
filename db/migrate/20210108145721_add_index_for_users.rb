class AddIndexForUsers < ActiveRecord::Migration[6.0]
  def change
    add_index :posts, :author_id
  end
end
