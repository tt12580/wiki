class CreateTaxons < ActiveRecord::Migration[5.0]
  def change
    create_table :taxons do |t|
      t.text :list

      t.timestamps
    end
  end
end
