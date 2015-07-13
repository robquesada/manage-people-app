class SendEmailJob < ActiveJob::Base
  queue_as :mailer

  def perform(person, action)
    PersonMailer.mail_people(person, action).deliver
  end
end
