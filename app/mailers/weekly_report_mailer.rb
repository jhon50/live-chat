class WeeklyReportMailer < ApplicationMailer

  def weekly_report
    @user = params[:report_data][:user]
    @report_data = params[:report_data]

    mail(to: @user.email, subject: 'Weekly Report')
  end
end
