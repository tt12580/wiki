class AddDeletedAtToWritings < ActiveRecord::Migration[5.0]
  def change
    add_column :writings, :deleted_at, :datetime
    add_index :writings, :deleted_at
  end
end
