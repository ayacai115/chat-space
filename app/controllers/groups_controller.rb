class GroupsController < ApplicationController
  def index
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)
    if @group.save
      redirect_to root
    else
      render new_group_path
    end
  end

  def edit
  end

  private
  def create_params
    params.require(:group).permit(:name)
  end
end
