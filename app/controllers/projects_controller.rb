class ProjectsController < ApplicationController
    before_action :authenticate_user!, except: [:index]
    before_action :set_project, only: [:show, :edit, :update, :submit, :preview]

    def index
        @projects = Project.where(reviewing: true).where(reviewed: true)
    end

    def new
        @project = current_user.projects.build
    end

    def create
        @project = current_user.projects.create!(
            title: nil, subtitle: nil, category: nil, image: nil, goal: 1, duration: Date.today + 1, story: nil, location: nil
        )
        redirect_to edit_project_path(@project)
    end

    def edit
    end

    def update
        if @project.update_attributes(project_params)
            flash[:notice] = "Basics was successfully updated."
            redirect_to project_rewards_path(@project)
        else
            render 'edit'
            #redirect_to edit_project_path(@project)
        end
    end

    def submit
        if @project.update_attributes(reviewing: true)
            flash[:notice] = "Your project was successfully submitted. Your project will be reviewed by us. Please wait a few days until notification will come."
            redirect_to root_path
        else
            puts @project.errors.full_messages
            redirect_to edit_project_path(@project)
        end
    end

    def preview
    end

    private
      def project_params
        params.require(:project).permit(:title, :subtitle, :category, :image, :goal, :duration, :story, :location)
      end

      def set_project
        @project = current_user.projects.find(params[:id])
      end
end
