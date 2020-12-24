class DeleteRate < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :up_rate
    remove_column :posts, :down_rate
  end
end
