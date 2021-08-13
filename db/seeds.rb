# # Create a main sample user.
# User.create!(name:  "Example User",
#              email: "example@railstutorial.org",
#              password:              "foobar",
#              password_confirmation: "foobar",
#              admin:     true,
#              activated: true,
#              activated_at: Time.zone.now)

# # Generate a bunch of additional users.

user1 = User.create!(name:  "Example 1", email: "example1@example.com", password: "password", password_confirmation: "password", profile_url: 'example1_profile')
user2 = User.create!(name:  "Example 2", email: "example2@example.com", password: "password", password_confirmation: "password", profile_url: 'example2_profile')

user1.followees << user2

user2.followees << user1


