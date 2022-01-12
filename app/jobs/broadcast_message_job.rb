class BroadcastMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    html = MessagesController.render partial: 'messages/message', locals: { message: message }

    ActionCable.server.broadcast "chat_channel_#{message.room_id}", html: html
  end
end
