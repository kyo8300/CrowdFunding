class RewardsController < ApplicationController
    before_action :authenticate_user!

    def index
        @project = current_user.projects.find(params[:project_id])
        @rewards = @project.rewards
    end

    def new
        @project = current_user.projects.find(params[:project_id])
        @reward = @project.rewards.build
    end

    def create
        @project = current_user.project.find(params[:project_id])
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

    private
      def reward_params
        params.require(:reward).permit(:title, :pledge, :description, :deliverytime, :limit, :ships)
      end
end
