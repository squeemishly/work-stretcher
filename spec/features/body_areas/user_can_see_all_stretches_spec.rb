require 'rails_helper'

RSpec.describe "a user can see a list of all stretches" do
  it "when they go to the stretches home page" do
    stretch1 = Stretch.new(name: "Standing Hamstring Stretch",
                          description: "Fun!",
                          picture: "https://media1.popsugar-assets.com/files/thumbor/V79mWjf6Xjup28tDXPGzoWBUVcU/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/03/12/2/192/1922729/2a8d7475eae1d6a3_propped-up-hamstring-stretch/i/Standing-Hamstring-Stretch.jpg")
    stretch2 = Stretch.new(name: "Standing Piriformis Stretch",
                          description: "Hell Yeah!",
                          picture: "https://s-media-cache-ak0.pinimg.com/236x/e7/99/99/e79999c0bf4f598d7470421cdfded29e.jpg")

    visit stretches_path

    expect(page).to have_css('h1', "All Suggested Stretches")
    expect(page).to have_css('h5', stretch1.name)
    expect(page).to have_css('h5', stretch2.name)
  end
end
