require "rails_helper"

RSpec.describe User do
  before do
    @user = build(:user, name: "Example User", email: "user@example.com", profile_url: 'user1_profile')
    @michael = build(:user)
    @archer = build(:user, name: "Sterling Archer", email: "duchess@example.gov", profile_url: 'user2_profile')
    @lana = build(:user, name: "Lana Kane", email: "hands@example.gov", profile_url: 'user3_profile')
  end

  it "should be valid" do
    expect(@user.valid?).to eq(true)
  end

  it "name should be present" do
    @user.name = " "
    expect(@user.valid?).to eq(false)
  end

  it "email should be present" do
    @user.email = "     "
    expect(@user.valid?).to eq(false)
  end

  it("email validation should accept valid addresses") do
    valid_addresses = ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", "first.last@foo.jp", "alice+bob@baz.cn"]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      expect(@user.valid?).to eq(true)
    end
  end

  it("email validation should reject invalid addresses") do
    invalid_addresses = ["user_at_foo.org", "user.", "user12"]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      expect(@user.valid?).to be false
    end
  end

  it("email addresses should be unique") do
    duplicate_user = @user.dup
    @user.save
    expect(duplicate_user.valid?).to eq(false)
  end

  it("password should be present (nonblank)") do
    @user.password = @user.password_confirmation = (" " * 6)
    expect(@user.valid?).to eq(false)
  end

end
