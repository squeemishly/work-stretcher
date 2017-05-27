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
    expect(page).to_not have_content "Admin Dashboard"
  end

  it "they can add a strech from the admin dashboard" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit stretches_path
    click_on "Admin Dashboard"

    click_on "Add a Stretch"
    fill_in "name", with: "Seated Piriformis Stretch"
    fill_in "description", with: "Stretch taht Piriformis!"
    fill_in "picture", with: "http://www.athletico.com/wp-content/uploads/2016/06/seated-piriformis-chair-stretch-608x603.jpg"
    click_on "Create Stretch"

    expect(page).to have_css('h3', "Seated Piriformis Stretch")
    expect(page).to have_content("Stretch taht Piriformis!")
    expect(page).to have_css("img[src*='http://www.athletico.com/wp-content/uploads/2016/06/seated-piriformis-chair-stretch-608x603.jpg']")

  end
end
