class Api::MessagesController < ApplicationController

  def index
    @messages = ChatMessage.includes(:user).all
  end

  def create
    message = current_user.chat_messages.new(message_params)
    if message.save
      response = {email: current_user.email, body: message.body}
      MessageBus.publish "/chat_channel", response
    else
      render json: {error: message.errors.full_message.join(',')}, status: 422
    end
  end

  private
    def message_params
      params.require(:message).permit(:body)
    end
end
