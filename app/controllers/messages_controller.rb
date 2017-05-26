class MessagesController < ApplicationController
  def index
    @groups = current_user.groups.order('id DESC').limit(5)
  end
end
