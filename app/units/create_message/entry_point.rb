module CreateMessage
  class EntryPoint

    include ::EntryPoint

    def initialize(params:, user:)
      @params = params
      @user = user
      @entity = Message.new(message_params)
      @action = Action.new(message: entity)
    end

    private

    attr_reader :params, :user

    def message_params
      params.merge(additional_params)
    end

    def additional_params
      { user: user }
    end

  end
end