class AddDeletedAtToTaxons < ActiveRecord::Migration[5.0]
  def change
    add_column :taxons, :deleted_at, :datetime
    add_index :taxons, :deleted_at
  end
end
