class ReworkDrafts < ActiveRecord::Migration[6.0]
  def change
    remove_column :drafts, :author
  end
end
