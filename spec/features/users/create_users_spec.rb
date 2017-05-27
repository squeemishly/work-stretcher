require 'rails_helper'

RSpec.describe "a user can be created" do
  it "they can create a login" do
    visit stretches_path
    click_on "Create an Account"

    fill_in "user[username]", with: "squee"
    fill_in "user[password]", with: "password"
    fill_in "user[email]", with: "squee@squee.com"
    click_on "Create Account"

    expect(page).to have_content "Welcome, squee!"
  end

  it "they don't fill in all the information, they're kicked back to the form" do
    visit stretches_path
    click_on "Create an Account"

    fill_in "user[password]", with: "password"
    fill_in "user[email]", with: "squee@squee.com"
    click_on "Create Account"

    expect(current_path).to eq new_user_path
    expect(page).to have_content "Account creation failed. Please try again."
  end
end
