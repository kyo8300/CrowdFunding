class AdminsController < ApplicationController
    before_action :authenticate_user!
    before_action :only_admin_user

    def index
        @reviewing_projects = Projects.reviewing?
    end

    private
      def only_admin_user
        redirect_to root_path unless current_user.admin?
      end
end
