class GroupsController < ApplicationController
  before_action :set_group, only: [:show]
  before_action :authenticate_user!

  def show
    @messages = Message.in_group(@group.id).latest
  end

  def index
    @groups = Group.latest
  end

  def subscriptions
    @users = User.where.not(id: current_user.id)
    @groups = Group.subscriptions(current_user.id)
  end

  private
  def group_params
    params.require(:group).permit(:name, :description, :is_active, user_ids: [])
  end

  def set_group
    @group = Group.find_by(id: params[:group_id])
    if @group.nil?
      flash[:danger] = t("groups.set_group.flash_danger")
      redirect_to home_path
    end
  end
end
