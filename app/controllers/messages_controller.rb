class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_path(params[:group_id])
    else
      redirect_to group_path(params[:group_id]), flash: { alert: "メッセージを入力してください。" }
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
