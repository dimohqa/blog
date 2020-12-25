class AddNameUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :firstName, :string
    add_column :users, :lastName, :string
  end
end
