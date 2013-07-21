# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username { Faker::Name.name }
    sequence(:email) { |n| "foo_#{n}@bar.com"}
    password "foobar"
  end
end
