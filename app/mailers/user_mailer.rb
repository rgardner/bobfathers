class UserMailer < ActionMailer::Base
  default to: 'rhg259@nyu.edu',
          from: ENV['MAILER_EMAIL']

  def feedback_email(message)
    @message = message
    mail(subject: 'Bobfathers Feedback')
  end
end
