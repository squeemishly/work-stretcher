require 'rails_helper'

RSpec.describe "a registered user can login" do
  it "when a user tries to login" do
    user = User.create(username: "squee", password: "password")

    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: "password"
    click_on "Login"

    expect(page).to have_content "Welcome, #{user.username}!"
  end
end
