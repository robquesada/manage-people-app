class Person < ActiveRecord::Base
  validates :first_name, :last_name, :email, :birthday, presence: true
  validates :first_name, :last_name, :job, length: { maximum: 75 }
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i 
  validates :job, presence: false
end
