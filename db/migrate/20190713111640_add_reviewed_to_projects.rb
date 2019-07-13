class AddReviewedToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :reviewed, :boolean, default: false
  end
end
