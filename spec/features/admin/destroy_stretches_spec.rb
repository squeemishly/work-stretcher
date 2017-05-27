require 'rails_helper'

RSpec.describe "an admin can destroy a stretch" do
  it "from the stretch show page" do
    admin = create(:user, role: 1)
    stretch = create(:stretch)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit stretch_path(stretch)
    click_on "Delete"

    expect(current_path).to eq stretches_path
    expect(page).to_not have_content stretch.name
  end

  # it "from the stretch index" do
  #   admin = create(:user, role: 1)
  #   stretch = create(:stretch)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  #
  #   visit stretches_path
  #   expect(page).to have_content stretch.name
  #   click_on "Delete"
  #
  #   expect(current_path).to eq stretches_path
  #   expect(page).to_not have_content stretch.name
  # end
  #
  # it "a user cannot destroy a stretch from the stretch show page" do
  #   user = create(:user)
  #   stretch = create(:stretch)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  #
  #   visit stretch_path(stretch)
  #   expect(page).to_not have_content "Delete"
  # end
  #
  # it "a user cannot destroy a stretch from the stretch index" do
  #   user = create(:user)
  #   stretch = create(:stretch)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
  #
  #   visit stretches_path
  #   expect(page).to have_content stretch.name
  #   expect(page).to_not have_content "Delete"
  # end
end
