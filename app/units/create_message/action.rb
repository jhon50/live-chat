module CreateMessage
  class Action

    def initialize(message:)
      @message = message
    end

    def call
      broadcast_message
    end

    private

    attr_reader :message

    def broadcast_message
      BroadcastMessageJob.perform_later(message)
    end

  end
end