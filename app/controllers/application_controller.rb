class ApplicationController < ActionController::Base
    before_action :set_search
    before_action :configure_permitted_parameters, if: :devise_controller?

    def set_search
        @search = Project.where(reviewing: true).where(reviewed: true).ransack(params[:q])
        if params[:category]
            @search_projects = Project.where(reviewing: true).where(reviewed: true).where(category: params[:category]).page(params[:page]).per(12)
        else
            @search_projects = @search.result.page(params[:page]).per(12)
        end
    end

    protected

        def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :website])
          devise_parameter_sanitizer.permit(:account_update, keys: [:username, :bio, :location, :website, :avatar, :twitter, :instagram])
        end
end
