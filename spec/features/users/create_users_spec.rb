require 'rails_helper'

RSpec.describe "a user can be created" do
  it "they can create a login" do
    visit new_user_path

    fill_in "user[username]", with: "squee"
    fill_in "user[password]", with: "password"
    click_on "Create Account"

    expect(page).to have_content "Welcome, squee!"
  end
end
