class AddProjectToRewards < ActiveRecord::Migration[5.2]
  def change
    add_reference :rewards, :project, foreign_key: true
  end
end
