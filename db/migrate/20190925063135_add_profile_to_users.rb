class AddProfileToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :location, :string
    add_column :users, :website, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
  end
end
