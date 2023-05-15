class CreateAssassins < ActiveRecord::Migration[7.0]
  def change
    create_table :assassins do |t|
      t.string :name
      t.string :weapon
      t.text :description
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
