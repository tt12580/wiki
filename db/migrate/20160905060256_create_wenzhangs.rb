class CreateWenzhangs < ActiveRecord::Migration[5.0]
  def change
    create_table :wenzhangs do |t|
      t.text :head
      t.text :content
      t.references :taxon, foreign_key: true

      t.timestamps
    end
  end
end
