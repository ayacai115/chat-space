class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(create_params)
    if @group.save
      redirect_to root_path
    else
      render new_group_path
    end
  end

  def edit
  end

  private
  def create_params
    params.require(:group).permit(:name, {user_ids: []})
  end
end
