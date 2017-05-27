require 'rails_helper'

RSpec.describe "an admin can create stretches" do
  it "they can add a strech from the admin dashboard" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit stretches_path
    click_on "Admin Dashboard"

    click_on "Add a Stretch"
    fill_in "stretch[name]", with: "Seated Piriformis Stretch"
    fill_in "stretch[description]", with: "Stretch that Piriformis!"
    fill_in "stretch[picture]", with: "http://www.athletico.com/wp-content/uploads/2016/06/seated-piriformis-chair-stretch-608x603.jpg"
    click_on "Create Stretch"

    expect(page).to have_content "Seated Piriformis Stretch has been created!"
    expect(current_path).to eq admin_path(:current_user)
  end

  it "a regular user cannot create a stretch" do
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_admin_stretch_path
    expect(page).to_not have_content "Add a Stretch"
    expect(page).to have_content "The page you were looking for doesn't exist."
  end
end
