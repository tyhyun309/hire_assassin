class CreateAssaAssassins < ActiveRecord::Migration[7.0]
  def change
    create_table :assa_assassins do |t|
      t.string :name
      t.string :weapon
      t.text :description
      t.float :price
      t.string :photo
      t.references :assa_user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
