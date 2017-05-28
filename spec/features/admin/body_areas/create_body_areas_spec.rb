require 'rails_helper'

RSpec.describe "an admin can create a body area" do
  it "from the admin dashboard" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_path(admin)
    click_on "Create a New Body Area"
    fill_in "body_area[name]", with: "Legs"
    click_on "Create Body area"

    expect(current_path).to eq body_areas_path
    expect(page).to have_content "Legs"
  end

  it "but a user cannot create a body area" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_path(user)
    expect(page).to have_content "The page you were looking for doesn't exist."

    visit new_admin_body_area_path
    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  it "the name must be present in order to make a new body part" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_path(admin)
    click_on "Create a New Body Area"
    click_on "Create Body area"

    expect(current_path).to eq new_admin_body_area_path
    expect(page).to have_content "You could not create a body area. Please try again."
  end
end
