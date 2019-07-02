class CreateRewards < ActiveRecord::Migration[5.2]
  def change
    create_table :rewards do |t|
      t.string :title
      t.integer :pledge
      t.text :description
      t.date :deliverytime
      t.integer :limit
      t.integer :ships

      t.timestamps
    end
  end
end
