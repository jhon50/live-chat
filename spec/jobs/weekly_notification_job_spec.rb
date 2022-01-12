require 'rails_helper'

RSpec.describe WeeklyNotificationJob, :type => :job do
  describe '#perform_later' do
    let(:user) { create(:user) }
    let(:room) { create(:room) }
    let(:message) { create(:message) }

    it 'enqueues a weekly notification job' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        WeeklyNotificationJob.perform_later(message)
      }.to have_enqueued_job
    end
  end
end