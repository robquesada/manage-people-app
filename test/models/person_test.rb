require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  test 'should save person with valid attributes' do
    person = create(:person)
    assert person.save
  end

  # Validate presence

  test 'should not save person without a first name' do
    person = build(:person, first_name: '')
    assert_not person.valid?
  end

  test 'should not save person without a last name' do
    person = build(:person, last_name: '')
    assert_not person.valid?
  end

  test 'should not save person without an email' do
    person = build(:person, email: '')
    assert_not person.valid?
  end

    test 'should not save person without a date of birth' do
    person = build(:person, birthday: '')
    assert_not person.valid?
  end

  # Validate format

  test 'should not save person without an invalid email' do
    person = build(:person, email: 'myemail@')
    assert_not person.valid?
  end

  # Validate max length

  test 'should not save person with a first name of more than 75 characters' do
    person = build(:person, first_name: ("n" * 76))
    assert_not person.valid?
  end

  test 'should not save person with a last name of more than 75 characters' do
    person = build(:person, last_name: ("n" * 76))
    assert_not person.valid?
  end

  test 'should not save person with an email of more than 255 characters' do
    person = build(:person, email: ("n" * 256))
    assert_not person.valid?
  end

  # Validate uniqueness

  test 'should not save person with the same email than a registered person' do
    first_person = create(:person, email: 'my_email@gmail.com')
    second_person = build(:person, email: 'my_email@gmail.com')
    assert_not second_person.save
  end

  # Validate birthday
  test 'should not save person with a future date as a birthday' do
    person = build(:person, birthday: (Date.today + 1))
    assert_not person.save
  end
end
