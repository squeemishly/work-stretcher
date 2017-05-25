require 'rails_helper'

RSpec.describe BodyAreaStretch do
  it "it has relationships" do
    stretch = create(:stretch)
    body_area = create(:body_area)
    body_area_stretch = create(:body_area_stretch, stretch: stretch, body_area: body_area)

    expect(body_area_stretch).to respond_to(:body_area)
    expect(body_area_stretch).to respond_to(:stretch)
  end
end
