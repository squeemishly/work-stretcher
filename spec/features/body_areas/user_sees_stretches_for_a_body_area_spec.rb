require 'rails_helper'

RSpec.describe "a user can see a list of stretches for a body part" do
  it "when they navigate to a body area page" do
    stretch1 = create(:stretch)
    stretch2 = create(:stretch)
    body_area1 = create(:body_area)
    create(:body_area_stretch, stretch: stretch1, body_area: body_area1)
    create(:body_area_stretch, stretch: stretch2, body_area: body_area1)

    visit body_area_path(body_area1, stretch_search: body_area1.name)

    expect(page).to have_css('h3', "Stretches for #{body_area1.name}")
    expect(page).to have_link(stretch1.name)
    expect(page).to have_link(stretch2.name)
  end
end
