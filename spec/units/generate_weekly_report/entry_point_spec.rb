require 'rails_helper'

RSpec.describe GenerateWeeklyReport::EntryPoint do
  subject { described_class }

  let(:user) { create(:user) }
  let(:user2) { create(:user) }

  let(:room) { create(:room) }
  let(:message) { create(:message, user: user) }
  let(:message2) { create(:message, user: user) }
  let(:message3) { create(:message, user: user2) }
  let(:message4) { create(:message, user: user2) }

  before do
    user
    user2

    room

    message
    message2
    message3
    message4
  end

  context 'when generating a weekly report' do
    describe '.call' do
      it 'sends an email with weekly report details' do
        expect { subject.call }.to change { ActionMailer::Base.deliveries.count }.by(2)
      end
    end

    describe '.report_data' do
      it 'yields an array with correct data' do
        yielded = []

        subject.new.report_data { |data| yielded << data }

        expect(yielded.count).to eq 2
        expect(yielded.first).to match(user: user, theirs: 2, after_last: 2, last_message_date: message2.created_at)
      end
    end
  end
end
