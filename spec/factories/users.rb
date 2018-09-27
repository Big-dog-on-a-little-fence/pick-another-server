FactoryBot.define do
  factory :user do
    username { "Joe" }
    email { "joe@gmail.com" }
    password { "password" }
    authentication_token { '1232' }
  end
end
