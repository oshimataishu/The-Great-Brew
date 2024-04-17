class CreateFavoriteCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :favorite_companies do |t|
      t.references :company, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
