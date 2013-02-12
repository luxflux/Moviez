# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :owner do
    sequence(:email) { |n| "mail#{n}@example.org" }
  end
end
