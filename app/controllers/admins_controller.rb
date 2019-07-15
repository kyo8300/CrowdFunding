class AdminsController < ApplicationController
    before_action :authenticate_user!
    before_action :only_admin_user

    def index
      @reviewing_projects = Project.where(reviewing: true).where(reviewed: false)
    end

    def approve
      @reviewed_project = Project.find(params[:id])
      if @reviewed_project.update_attributes(reviewed: true)
        flash[:notice] = "The project was approved."
        redirect_to admins_path
      else
        puts @reviewed_project.errors.full_messages
        render 'index'
      end
    end

    def reject
      @rejected_project = Project.find(params[:id])
      if @rejected_project.update_attributes(reviewing: false)
        flash[:notice] = "The project was rejected."
        redirect_to admins_path
      else
        puts @rejected_project.errors.full_messages
        redirect_to root_path
      end
    end

    private
      def only_admin_user
        redirect_to root_path unless current_user.admin?
      end
end
