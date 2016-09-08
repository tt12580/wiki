class AddDeletedAtToWenzhangs < ActiveRecord::Migration[5.0]
  def change
    add_column :wenzhangs, :deleted_at, :datetime
    add_index :wenzhangs, :deleted_at
  end
end
