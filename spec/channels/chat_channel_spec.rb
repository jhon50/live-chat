require 'rails_helper'

RSpec.describe ChatChannel, type: :channel do
  context 'when subscribing to a channel' do
    it "successfully subscribes" do
      subscribe room_id: 1
      expect(subscription).to be_confirmed
    end
  end
end
