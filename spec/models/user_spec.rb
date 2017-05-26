require 'rails_helper'

RSpec.describe User do
  it "exists" do
    user = User.create(username: "squee", password: "password", email: "squee@squee.com")

    expect(user).to be_valid
  end

  it "is invalid without a username" do
    user = User.create(password: "password", email: "squee@squee.com")

    expect(user).to be_invalid
  end

  it "is invalid without a unique username" do
    user = User.create(username: "squee", password: "password", email: "squee@squee.com")
    user2 = User.create(username: "squee", password: "password", email: "squee@squee.com")

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
end
