class RewardsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project
    before_action :set_reward, only: [:edit, :update, :destroy]

    def index
        @rewards = @project.rewards
    end

    def new
        @reward = @project.rewards.build
    end

    def create
        @reward = @project.rewards.build(reward_params)
        if @reward.save
            flash[:notice] = "The Reward was successfully added."
            redirect_to project_rewards_path(@project)
        else
            render 'rewards/new'
        end
    end

    def edit
    end

    def update
        if @reward.update_attributes(reward_params)
            flash[:notice] = "The reward was successfully updated."
            redirect_to project_rewards_path(@project)
        else
            render 'edit'
        end
    end

    def destroy
        @reward.destroy

        flash[:notice] = "The reward was successfully deleted."
        redirect_to project_rewards_path
    end

    private
      def reward_params
        params.require(:reward).permit(:title, :pledge, :description, :deliverytime, :limit, :ships)
      end

      def set_project
        @project = current_user.projects.find(params[:project_id])
      end

      def set_reward
        @reward = @project.rewards.find(params[:id])
      end
end
