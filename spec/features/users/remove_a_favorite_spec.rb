require 'rails_helper'

RSpec.describe "a user can remove a stretch from their favorites" do
  it "when they click the remove button on their profile page" do
    stretch = create(:stretch)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit stretches_path
    click_on "Favorite"

    visit user_path(user)
    expect(page).to have_content stretch.name

    click_on "Remove from Favorites"
    expect(page).to_not have_content stretch.name
  end

  # it "when they click the remove button from the stretches index" do
  #   stretch = create(:stretch)
  #   user = create(:user)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #
  #   visit stretches_path
  #   expect(page).to_not have_content "Remove from Favorites"
  #
  #   click_on "Favorite"
  #   click_on "Remove from Favorites"
  #
  #   visit user_path(user)
  #   expect(page).to_not have_content stretch.name
  # end

  # it "when they click the remove button from the stretch show page" do
  #   stretch = create(:stretch)
  #   user = create(:user)
  #   allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
  #
  #   visit stretch_path(stretch)
  #   expect(page).to_not have_content "Remove from Favorites"
  #
  #   click_on "Favorite"
  #   click_on "Remove from Favorites"
  #
  #   visit user_path(user)
  #   expect(page).to_not have_content stretch.name
  # end
end
