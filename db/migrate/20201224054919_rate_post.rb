class RatePost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :up_rate, :string
    add_column :posts, :down_rate, :string
  end
end
