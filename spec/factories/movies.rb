# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "MyString"
    overview "Long text"
    tagline 'Short text'
    tmdb_id 1337
    sequence(:disc_number) { |n| n }
    association :owner
  end
end
