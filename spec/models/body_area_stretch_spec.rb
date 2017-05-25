require 'rails_helper'

RSpec.describe BodyAreaStretch do
  it "it has relationships" do
    stretch = create(:stretch)
    body_area = create(:body_area)
    body_area_stretch = BodyAreaStretch.create(stretch_id: stretch.id, body_area_id: body_area.id)

    expect(body_area_stretch).to respond_to(:body_area)
    expect(body_area_stretch).to respond_to(:stretch)
  end
end
