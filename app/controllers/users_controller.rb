class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

    def show
        @user = User.find(params[:id])
        @projects = @user.projects.page(params[:page]).per(8)
    end

    def backed
        @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
          flash[:notice] = "User profile successfully updated."
          redirect_to edit_user_path(@user)
      else
          render 'edit'
          #redirect_to edit_user_path(@user)
      end
    end


    private

      def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user === @user
      end

      def user_params
        params.require(:user).permit(:username, :avatar, :location, :website, :twitter, :instagram, :bio)
      end

end
