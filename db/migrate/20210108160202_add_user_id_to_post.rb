class AddUserIdToPost < ActiveRecord::Migration[6.0]
  def change
    change_table :posts do |t|
      t.belongs_to :user
    end
  end
end
