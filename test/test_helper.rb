ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

class ActiveSupport::TestCase
  fixtures :all
  include FactoryGirl::Syntax::Methods
end

Rails.application.load_seed
