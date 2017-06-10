class GroupsController < ApplicationController
  before_action :set_group, only: [ :edit, :update]

  def index
    @groups = current_user.groups
    render :_side_bar
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(create_params)
    if @group.save
      redirect_to group_path(@group), flash: { notice: "チャットグループが作成されました。" }
    else
      render new_group_path
    end
  end

  def show
    redirect_to group_messages_path(params[:id])
  end

  def edit
  end

  def update
    if set_group.update(create_params)
      redirect_to group_path(@group)
    else
      render :edit
    end
  end


  private

  def create_params
    params.require(:group).permit(:name).merge(user_ids: params[:group][:user_ids])
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
