require 'rails_helper'

RSpec.describe "a user can navigate using the navbar" do
  it "should have all links on the home page" do
    visit stretches_path
    expect(page).to have_link("Stretches Home", stretches_path)
    expect(page).to have_link("Sign In", login_path)
    expect(page).to have_link("Create an Account", new_user_path)
    expect(page).to have_content "Find a Stretch"
  end

  it "should have all links on the new user page" do
    visit new_user_path
    expect(page).to have_link("Stretches Home", stretches_path)
    expect(page).to have_link("Sign In", login_path)
    expect(page).to have_link("Create an Account", new_user_path)
    expect(page).to have_content "Find a Stretch"
  end

  it "should have all links on the login page" do
    visit login_path
    expect(page).to have_link("Stretches Home", stretches_path)
    expect(page).to have_link("Sign In", login_path)
    expect(page).to have_link("Create an Account", new_user_path)
    expect(page).to have_content "Find a Stretch"
  end
end
