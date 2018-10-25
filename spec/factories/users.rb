FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "TestUser#{n}" }
    sequence(:email) {|n| "test_user_#{n}@example.com" }
    password { "password" }
    authentication_token { '1232' }
    
    factory :user_with_tunes do
      transient do
        tunes_count { 5 }
      end
      after(:create) do |user, evaluator|
        create_list(:tune, evaluator.tunes_count, users: [user])
      end
    end
  end
  
  factory :unique_user, class: User do
    username { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    password { "password" }
    authentication_token { '1232' }
  end
end
