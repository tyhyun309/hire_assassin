class AddNameToAssaUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :assa_users, :name, :string
  end
end
