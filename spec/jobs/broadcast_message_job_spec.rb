require 'rails_helper'

RSpec.describe BroadcastMessageJob, :type => :job do
  describe '#perform_later' do
    let(:user) { create(:user) }
    let(:room) { create(:room) }
    let(:message) { create(:message) }

    it 'enqueues a broadcast message job' do
      ActiveJob::Base.queue_adapter = :test
      expect {
        BroadcastMessageJob.perform_later(message)
      }.to have_enqueued_job
    end
  end
end