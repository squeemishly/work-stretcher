require 'rails_helper'

RSpec.describe "an admin can edit stretches" do
  it "when they access them from the stretch show page" do
    admin = create(:user, role: 1)
    stretch = create(:stretch)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit stretch_path(stretch)
    click_on "Edit"

    fill_in "stretch[name]", with: "High Fives!"
    fill_in "stretch[description]", with: "not a stretch, but just as awesome"
    click_on "Update Stretch"

    expect(current_path).to eq stretch_path(stretch)
    expect(page).to have_content "High Fives!"
    expect(page).to have_content "not a stretch, but just as awesome"
  end

  it "when they access the edit form from the stretch index page" do
    admin = create(:user, role: 1)
    stretch = create(:stretch)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit stretches_path
    click_on "Edit"

    fill_in "stretch[name]", with: "High Fives!"
    fill_in "stretch[description]", with: "not a stretch, but just as awesome"
    click_on "Update Stretch"

    expect(current_path).to eq stretch_path(stretch)
    expect(page).to have_content "High Fives!"
    expect(page).to have_content "not a stretch, but just as awesome"
  end

  it "but a regular user cannot edit a strecth" do
    user = create(:user)
    stretch = create(:stretch)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit stretch_path(stretch)
    expect(page).to_not have_content "Edit"

    visit edit_admin_stretch_path(stretch)
    expect(page).to have_content "The page you were looking for doesn't exist."
  end

  it "when they access the edit form from the stretch index page" do
    user = create(:user)
    stretch = create(:stretch)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit stretches_path
    expect(page).to_not have_content "Edit"
  end

  it "they cannot leave a field blank" do
    admin = create(:user, role: 1)
    stretch = create(:stretch)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit stretch_path(stretch)
    click_on "Edit"

    fill_in "stretch[name]", with: ""
    click_on "Update Stretch"

    expect(current_path).to eq edit_admin_stretch_path(stretch)
    expect(page).to have_content "You must fill in all information to edit this stretch."
  end
end
