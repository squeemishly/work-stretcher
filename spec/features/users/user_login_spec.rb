require 'rails_helper'

RSpec.describe "a registered user can login" do
  it "when a user tries to login" do
    user = User.create(username: "squee", password: "password")

    visit login_path

    fill_in "user[username]", with: user.username
    fill_in "user[password]", with: "password"
    click_on "Login"

    expect(page).to have_content "Welcome, #{user.username}!"
  end
end
