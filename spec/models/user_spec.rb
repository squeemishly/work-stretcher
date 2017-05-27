require 'rails_helper'

RSpec.describe User do
  it "exists" do
    user = create(:user)

    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = User.create(password: "password", email: "squee@squee.com")

    expect(user).to be_invalid
  end

  it "is invalid without a unique username" do
    user = User.create(username: "squee", password: "password", email: "squee@squee.com")
    user2 = User.create(username: "squee", password: "password", email: "squee@myself.com")

    expect(user2).to be_invalid
  end

  it "is invalid without a password" do
    user = User.create(username: "squee", email: "squee@squee.com")

    expect(user).to be_invalid
  end

  it "is invalid without an email" do
    user = User.create(username: "squee", password: "password")

    expect(user).to be_invalid
  end

  it "is invalid without a unique email" do
    user = User.create(username: "squee", password: "password", email: "squee@squee.com")
    user2 = User.create(username: "squeemishly", password: "password", email: "squee@squee.com")

    expect(user2).to be_invalid
  end

  it "can be created as an admin" do
    user = create(:user, role: 1)

    expect(user.role).to eq "admin"
    expect(user.admin?).to be_truthy
  end

  it "is by default a user" do
    user = create(:user)

    expect(user.role).to eq "default"
    expect(user.default?).to be_truthy
  end
end
