class AddReviewingToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :reviewing, :boolean, default: false
  end
end
