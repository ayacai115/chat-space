class MessagesController < ApplicationController
  def create
    Message.create(create_params)
    redirect_to group_path(params[:group_id])
  end


  private
  def create_params
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end
end
