class AddArrayRate < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :up_rate, :string, array: true, default: []
    add_column :posts, :down_rate, :string, array: true, default: []
  end
end
