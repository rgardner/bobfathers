class UserMailer < ActionMailer::Base
  default to: User.find_by(admin: true).email,
          from: APP_CONFIG['mail_delivery_email']

  def feedback_email(message)
    @message = message
    mail(subject: 'Bobfathers Feedback')
  end
end
