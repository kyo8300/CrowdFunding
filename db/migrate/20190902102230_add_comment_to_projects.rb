class AddCommentToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :admin_comment, :string
  end
end
