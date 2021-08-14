FactoryBot.define do
  factory :follow do
    follower_id { 1 }
    followee_id { 1 }
  end

  factory :picture do
    
  end

  factory :album do
    name { "MyString" }
    privacy { 1 }
  end

  factory :user do
    name { "Michael Example" }
    email { "michael@example.com" }
    password { "password" }
    profile_url { "michael_profile" }
  end
end