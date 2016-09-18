class AddAuthorToWenzhangs < ActiveRecord::Migration[5.0]
  def change
    add_column :wenzhangs, :author, :text
  end
end
