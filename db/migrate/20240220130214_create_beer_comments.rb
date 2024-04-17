class CreateBeerComments < ActiveRecord::Migration[6.1]
  def change
    create_table :beer_comments do |t|
      t.text :comment
      t.references :user, foreign_key: true
      t.references :beer, foreign_key: true

      t.timestamps
    end
  end
end
