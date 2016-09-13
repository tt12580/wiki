class AddDeletedAtToNotices < ActiveRecord::Migration[5.0]
  def change
    add_column :notices, :deleted_at, :datetime
    add_index :notices, :deleted_at
  end
end
