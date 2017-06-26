require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe User do
    subject(:user) do
      FactoryGirl.build(:user,
      email: "noahskang@gmail.com",
      password: "this_password")
    end

  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:password_digest)}
  it{should validate_length_of(:email).is_at_least(6)}

# rethink this as: describe what this method does"
  describe "#is_password?" do
    it "verifies a password is correct" do
      expect(user.is_password?("this_password")).to be true
    end

    it "verifies a password is not correct" do
      expect(user.is_password?("different_password")).to be false
    end
  end

  describe ".find_by_credentials" do
    before {user.save!}

    it "returns user given good credentials" do
      expect(User.find_by_credentials("noahskang@gmail.com", "this_password")).to eq(user)
    end

    it "returns nil given bad credentials" do
      expect(User.find_by_credentials("asda", "asdf asd")).to eq(nil)
    end
  end
end
