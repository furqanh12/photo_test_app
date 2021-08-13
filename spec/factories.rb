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
    password_digest { User.digest('password') }
    admin { true }
    activated { true }
    activated_at { Time.zone.now }
  end
end