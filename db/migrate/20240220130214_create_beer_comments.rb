class CreateBeerComments < ActiveRecord::Migration[6.1]
  def change
    create_table :beer_comments do |t|
      t.text :comment
      t.integer :user_id
      t.integer :beer_id

      t.timestamps
    end
  end
end
