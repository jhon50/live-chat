class WeeklyNotificationJob < ApplicationJob
  queue_as :default

  def perform(*args)
    GenerateWeeklyReport::EntryPoint.call
  end
end
