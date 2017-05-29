require 'rails_helper'

RSpec.describe "a user can favorite a stretch" do
  it "from the stretches index" do
    body_area = create(:body_area)
    stretch = create(:stretch)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit stretches_path
    click_on "Favorite"
    # expect(page).to have_content "#{stretch.name} has been added to your favorites!"

    visit user_path(user)
    expect(page).to have_css('h3', "Favorites")
    expect(page).to have_link(stretch.name, href: stretch_path(stretch))
  end

  it "from the stretch show page" do
    body_area = create(:body_area)
    stretch = create(:stretch)
    user = create(:user)

    visit stretch_path(stretch)
    click_on "Favorite"

    visit user_path(user)
    expect(page).to have_css('h3', "Favorites")
    expect(page).to have_link(stretch.name, href: stretch_path(stretch))
  end

  it "but they must be logged in to do it" do
    stretch = create(:stretch)
    visit stretches_path

    expect(page).to have_content stretch.name
    expect(page).to_not have_content "Favorite"
  end

end
