require 'rails_helper'

RSpec.describe "a user can logout" do
  it "when they click the logout button" do
    user = create(:user)

    visit login_path

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: "password"
    click_on "Login"

    expect(page).to have_content "Welcome, #{user.username}!"

    click_on "Logout"
    expect(page).to_not have_content "Welcome, #{user.username}!"
    expect(page).to have_content "You have been logged out."
  end

  it "there isn't a logout button until a user is logged in" do
    user = create(:user)

    visit login_path
    expect(page).to_not have_link "Logout"

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: "password"
    click_on "Login"
    expect(page).to have_link "Logout"
  end
end
