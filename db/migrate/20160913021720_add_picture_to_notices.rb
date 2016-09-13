class AddPictureToNotices < ActiveRecord::Migration[5.0]
  def change
    add_column :notices, :picture, :string
  end
end
