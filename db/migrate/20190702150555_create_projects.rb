class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :subtitle
      t.integer :category
      t.string :image
      t.integer :goal
      t.date :duration
      t.text :story
      t.integer :location

      t.timestamps
    end
  end
end