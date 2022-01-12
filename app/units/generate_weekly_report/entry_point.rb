module GenerateWeeklyReport
  class EntryPoint
    include ::EntryPoint

    def call
      report_data do |data|
        WeeklyReportMailer.with(report_data: data).weekly_report.deliver_now
      end
    end

    def report_data
      messages = Message.where('created_at > ? AND created_at < ?', 7.days.ago, Time.current)

      User.find_each(batch_size: 100) do |user|
        mine_last = messages.where(user: user).last

        theirs = messages.where.not(user: user)

        after_last = theirs.where('created_at > ?', mine_last.created_at).count

        report_data = { user: user, theirs: theirs.count, after_last: after_last, last_message_date: mine_last.created_at }

        yield report_data
      end
    end
  end
end