class AddPhotoToAssassins < ActiveRecord::Migration[7.0]
  def change
    add_column :assassins, :photo, :string
  end
end
