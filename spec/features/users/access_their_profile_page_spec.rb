require 'rails_helper'

RSpec.describe "a user can access their profile page" do
  it "from the nav bar on any page" do
    stretch = create(:stretch)
    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit stretches_path
    expect(page).to have_content stretch.name
    click_on "#{user.username}'s Profile"

    expect(page).to have_css('h1', "#{user.username}'s Profile")
    expect(page).to have_content "Favorites"
    expect(page).to_not have_content stretch.name
  end
end
