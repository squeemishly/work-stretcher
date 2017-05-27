require 'rails_helper'

RSpec.describe "an admin can create stretches" do
  it "they can access the admin dashboard" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit stretches_path
    click_on "Admin Dashboard"
    expect(page).to have_css('h3', "Admin Dashboard")
  end

  it "a regular user cannot access the admin dashboard" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit stretches_path
    expect(page).to_not have_link "Admin Dashboard"

    visit admin_path(:current_user)
    expect(page).to_not have_content "Admin Dashboard"
    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
