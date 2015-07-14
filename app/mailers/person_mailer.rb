class PersonMailer < ActionMailer::Base
  include Resque::Mailer
  default to: Proc.new { Person.pluck(:email) },
          from: 'noreply@peoplesystem.com'

  def mail_people(person_hash, action)
    @person_hash = person_hash
    @action = action
    mail(subject: "People App - New person #{@action}")
  end
end
