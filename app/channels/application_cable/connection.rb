module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = authorized_user
    end

    private

    def authorized_user
      env['warden'].user.present? ? env['warden'].user : reject_unauthorized_connection
    end
  end
end
