FactoryGirl.define do
  factory :person do
    first_name 'Joe'
    last_name 'Dan'
    sequence(:email) { |n| "joedan#{n}@example.com" }
    gender 'Male'
    birthday '12/12/1990'
    picture 'www.example.com/my_picture.jpg'
    bio 'I am a man who walks alone.'
  end
end
