require 'rails_helper'

RSpec.describe "a user can logout" do
  it "when they click the logout button" do
    user = User.create(username: "squee", password: "password")

    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: "password"
    click_on "Login"

    expect(page).to have_content "Welcome, #{user.username}!"

    click_on "Logout"
    expect(page).to_not have_content "Welcome, #{user.username}!"
  end
end
