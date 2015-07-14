class SendEmailJob < ActiveJob::Base
  queue_as :mailer

  def perform(person_hash, action)
    PersonMailer.mail_people(person_hash, action).deliver
  end
end
