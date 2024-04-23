class CreateBeerFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :beer_favorites do |t|
      t.references :beer, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
