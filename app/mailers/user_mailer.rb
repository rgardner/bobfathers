class UserMailer < ActionMailer::Base
  default to: User.find_by(admin: true).email,
          from: ENV['MAILER_EMAIL']

  def feedback_email(message)
    @message = message
    mail(subject: 'Bobfathers Feedback')
  end
end
