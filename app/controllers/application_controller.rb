class ApplicationController < ActionController::Base
    before_action :set_search

    def set_search
        @search = Project.where(reviewing: true).where(reviewed: true).ransack(params[:q])
        if params[:category]
            @search_projects = Project.where(reviewing: true).where(reviewed: true).where(category: params[:category]).page(params[:page]).per(12)
        else
            @search_projects = @search.result.page(params[:page]).per(12)
        end
    end
end
