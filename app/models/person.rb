class Person < ActiveRecord::Base
  validates :first_name, :last_name, :email, :birthday, presence: true
  validates :first_name, :last_name, :job, length: { maximum: 75 }
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i 
  validates :job, presence: false
  validate :birthday_cannot_be_in_the_past

  def birthday_cannot_be_in_the_past
    errors.add(:birthday, "has to be in the past") if
      !birthday.blank? and birthday > Date.today
  end
end
