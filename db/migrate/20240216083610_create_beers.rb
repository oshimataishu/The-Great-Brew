class CreateBeers < ActiveRecord::Migration[6.1]
  def change
    create_table :beers do |t|
      t.string :name
      t.text :feature
      t.integer :price_level, null: false
      t.integer :fruity, null: false
      t.integer :sharpness, null: false
      t.integer :bitter, null: false
      t.integer :sour, null: false
      t.integer :aftertaste, null: false
      t.integer :price, null: false
      t.references :company, foreign_key: true
      t.integer :country_id, foreign_key: true

      t.timestamps
    end
  end
end
