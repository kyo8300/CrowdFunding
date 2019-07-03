class ProjectsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :set_project, only: [:show, :edit, :update, :destroy]

    def index
    end

    def new
        @project = current_user.projects.build
    end

    def create
        @project = current_user.projects.build(project_params)
        if @project.save
            flash[:notice] = "The Basics have been successfully saved."
            redirect_to root_path
        else
            render 'projects/new'
        end
    end

    private
      def project_params
        params.require(:project).permit(:title, :subtitle, :category, :image, :goal, :duration, :story, :location)
      end

      def set_project
        @project = current_user.projects.find(params[:id])
      end
end
