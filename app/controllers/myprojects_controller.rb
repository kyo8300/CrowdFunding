class MyprojectsController < ApplicationController

    def index
        @my_projects = current_user.projects.page(params[:page]).per(8)
    end
end
