class StoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user
    before_action :set_project, only: [:edit, :update]

    def edit
    end

    def update
        if @project.update_attributes(story_params)
            flash[:notice] = "The story was successfully updated."
            redirect_to edit_story_path(@project)
        else
            flash[:notice] = "The story was NOT successfully updated."
            redirect_to edit_project_path(@project)
        end
    end

    private
      def story_params
        params.require(:project).permit(:story)
      end

      def correct_user
        @project = current_user.projects.find_by(id: params[:id])
        redirect_to root_path if @project.nil?
      end

      def set_project
        @project = current_user.projects.find(params[:id])
      end
end