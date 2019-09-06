class ApplicationController < ActionController::Base
    before_action :set_search

    def set_search
        @search = Project.ransack(params[:q])
        @search_projects = @search.result
        @search_projects = @search_projects.where(reviewing: true).where(reviewed: true)
    end
end
