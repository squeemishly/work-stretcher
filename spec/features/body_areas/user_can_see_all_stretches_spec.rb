require 'rails_helper'

RSpec.describe "a user can see a list of all stretches" do
  it "when they go to the stretches home page" do
    stretch1 = create(:stretch)
    stretch2 = create(:stretch)

    visit stretches_path

    expect(page).to have_css('h1', "All Suggested Stretches")
    expect(page).to have_css('h5', stretch1.name)
    expect(page).to have_css('h5', stretch2.name)
  end
end
