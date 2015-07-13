FactoryGirl.define do
  factory :person do
    first_name 'Joe'
    last_name 'Dan'
    sequence(:email) { |n| "joedan#{n}@example.com" }
    gender 'Male'
    birthday '12/12/1990'
    picture 'www.example.com/my_picture.jpg'
    bio 'I am a man who walks alone.'

    # Present validations
    trait :no_first_name do
      first_name ''
    end

    # trait :no_first_name do
    #   first_name ''
    # end

    # trait :no_email do
    #   email ''
    # end

    # # Max length validations
    # trait :long_first_name do
    #   first_name 'Mynameistoolooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong'
    # end

    # trait :long_first_name do
    #   first_name 'Mynameistoolooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooong'
    # end

    # trait :invalid_email do
    #   email 'mymail@'
    # end

    # trait :gender do
    #   gender { ["male", "female", "other"].sample }
    # end
  end
end
