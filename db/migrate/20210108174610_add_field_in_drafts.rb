class AddFieldInDrafts < ActiveRecord::Migration[6.0]
  def change
    change_table :drafts do |t|
      t.belongs_to :user
    end
  end
end
