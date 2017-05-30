require 'rails_helper'

RSpec.describe "a user can add a comment to a favorite stretch" do
  # it "when they click add comment on their profile" do
  #   user = create(:user)
  #   body_area = create(:body_area)
  #   stretch = create(:stretch)
  #   create(:body_area_stretch, stretch: stretch, body_area: body_area)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #
  #   visit stretches_path
  #   click_on "Favorite"
  #   visit user_path(user)
  #
  #   click_on "Add Notes"
  #   expect(page).to have_css('h3', "Add notes for #{stretch.name}")
  #   fill_in "note[note]", with: "pull hips back to increase the stretch"
  #   click_on "Create Note"
  #
  #   click_on "Remove Note"
  #   expect(page).to_not have_content "pull hips back to increase the stretch"
  # end
end
