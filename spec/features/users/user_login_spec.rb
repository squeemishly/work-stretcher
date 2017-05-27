require 'rails_helper'

RSpec.describe "a registered user can login" do
  it "when a user tries to login" do
    user = create(:user)

    visit stretches_path
    click_on "Sign In"

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: "password"
    click_on "Login"

    expect(page).to have_content "Welcome, #{user.username}!"
  end

  it "they can't login without a password" do
    user = create(:user)

    visit stretches_path
    click_on "Sign In"

    fill_in "session[username]", with: user.username
    click_on "Login"

    expect(current_path).to eq login_path
    expect(page).to have_content "Login failed. Please try again."
  end

  it "they can't login without a username" do
    user = create(:user)

    visit stretches_path
    click_on "Sign In"

    fill_in "session[password]", with: "password"
    click_on "Login"

    expect(current_path).to eq login_path
    expect(page).to have_content "Login failed. Please try again."
  end

  it "they can't login without a valid username" do
    user = create(:user)

    visit stretches_path
    click_on "Sign In"

    fill_in "session[username]", with: "username"
    fill_in "session[password]", with: "password"
    click_on "Login"

    expect(current_path).to eq login_path
    expect(page).to have_content "Login failed. Please try again."
  end

  it "they can't login without a valid password" do
    user = create(:user)

    visit stretches_path
    click_on "Sign In"

    fill_in "session[username]", with: user.username
    fill_in "session[password]", with: "thingsnstuff"
    click_on "Login"

    expect(current_path).to eq login_path
    expect(page).to have_content "Login failed. Please try again."
  end
end
