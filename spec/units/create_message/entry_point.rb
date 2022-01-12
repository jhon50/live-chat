require 'rails_helper'

RSpec.describe CreateMessage::EntryPoint do
  subject { described_class.call(params: params, user: user) }

  let(:user) { create(:user) }
  let(:room) { create(:room) }

  let(:params) do
    {
      content: 'Infinity War',
      room_id: room.id
    }
  end

  context 'when creating a new message' do
    it 'creates a message' do
      subject

      expect(subject).to have_attributes(
        user_id: user.id,
        room_id: room.id,
        content: 'Infinity War'
      )
    end
  end
end
