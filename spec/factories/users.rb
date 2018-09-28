FactoryBot.define do
  factory :user do
    username { "Joe" }
    email { "joe@gmail.com" }
    password { "password" }
    authentication_token { '1232' }
  end
end

FactoryBot.define do
  factory :unique_user, class: User do
    username { Faker::Name.unique.first_name }
    email { Faker::Internet.unique.email }
    password { "password" }
    authentication_token { '1232' }
  end
end