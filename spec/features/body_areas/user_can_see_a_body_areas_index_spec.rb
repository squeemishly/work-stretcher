require 'rails_helper'

RSpec.describe "a user can see a body area index" do
  it "they can see the index by clicking a link on the home page" do
    body_area = create(:body_area)

    visit stretches_path
    click_on "See Stretches by Body Area"

    expect(page).to have_css('h3', "Stretches by Body Area")
    expect(page).to have_content body_area.name
  end

  it "they can see a list of stretches by body area" do
    body_area = create(:body_area)
    stretch = body_area.stretches.create(name: "Standing Hamstring Stretch", description: "Yippee!", picture: "https://media1.popsugar-assets.com/files/thumbor/V79mWjf6Xjup28tDXPGzoWBUVcU/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/03/12/2/192/1922729/2a8d7475eae1d6a3_propped-up-hamstring-stretch/i/Standing-Hamstring-Stretch.jpg")

    visit stretches_path
    click_on "See Stretches by Body Area"

    expect(page).to have_css('h3', "Stretches by Body Area")
    click_on body_area.name

    expect(current_path).to eq body_area_path(body_area)
    expect(page).to have_content body_area.name
    expect(page).to have_content stretch.name
  end
end
