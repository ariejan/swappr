FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "john-#{n}@example.com" }
    password              "tester123"
    password_confirmation "tester123"
  end

end
