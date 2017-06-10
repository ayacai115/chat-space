class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @groups =  current_user.groups
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path(params[:group_id]), notice: "メッセージが投稿されました" }
        format.json
      end
    else
      redirect_to group_messages_path(params[:group_id]), flash: { alert: "メッセージを入力してください。" }
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
