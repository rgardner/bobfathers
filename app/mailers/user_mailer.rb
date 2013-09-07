class UserMailer < ActionMailer::Base
  default from: ENV['MAILER_EMAIL']

  def feedback_email(message)
    @message = message
    mail(to: 'rhg259@nyu.edu', subject: 'Bobfathers Feedback')
  end

  def verification_email(idea)
    @idea = idea
    mail(to: @idea.suggested_by, subject: 'Bobfathers Idea Verification')
  end
end
