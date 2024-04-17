class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :phone_number, null: false
      t.string :email, null: false
      t.boolean :is_active, default: true, null: false
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
