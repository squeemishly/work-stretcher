require 'rails_helper'

RSpec.describe "a user can see a stretch for a body part" do
  it "when they click on the stretch from a list of stretches" do
    stretch = create(:stretch)

    visit stretches_path

    click_on stretch.name

    expect(page).to have_css('h3', stretch.name)
    expect(page).to have_content(stretch.description)
    expect(page).to have_css("img[src*='https://media1.popsugar-assets.com/files/thumbor/V79mWjf6Xjup28tDXPGzoWBUVcU/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/03/12/2/192/1922729/2a8d7475eae1d6a3_propped-up-hamstring-stretch/i/Standing-Hamstring-Stretch.jpg']")
  end

  it "when they search for a stretch" do
    stretch1 = create(:stretch)
    body_area1 = create(:body_area)
    create(:body_area_stretch, stretch: stretch1, body_area: body_area1)
    stretch2 = create(:stretch)
    body_area2 = create(:body_area)
    create(:body_area_stretch, stretch: stretch2, body_area: body_area2)

    visit stretches_path
    expect(page).to have_content(stretch1.name)
    expect(page).to have_content(stretch2.name)

    expect(page).to have_content("Find a stretch: ")
    fill_in "stretch_search", with: body_area1.name
    click_on "Go!"

    expect(page).to have_css('h3', "Stretches for #{body_area1.name}")

    click_on stretch1.name

    expect(page).to have_css('h3', stretch1.name)
    expect(page).to have_content(stretch1.description)
    expect(page).to have_css("img[src*='https://media1.popsugar-assets.com/files/thumbor/V79mWjf6Xjup28tDXPGzoWBUVcU/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/03/12/2/192/1922729/2a8d7475eae1d6a3_propped-up-hamstring-stretch/i/Standing-Hamstring-Stretch.jpg']")
    expect(page).to_not have_content(stretch2.name)
  end
end
