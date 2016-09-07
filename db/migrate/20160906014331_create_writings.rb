class CreateWritings < ActiveRecord::Migration[5.0]
  def change
    create_table :writings do |t|
      t.text :name
      t.text :mainbody
      t.references :wiki, foreign_key: true

      t.timestamps
    end
  end
end
