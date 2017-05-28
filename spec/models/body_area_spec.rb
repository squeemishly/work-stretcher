require 'rails_helper'

RSpec.describe BodyArea do
  it "exists" do
    body_area = create(:body_area)

    expect(body_area).to be_valid
  end

  it "must have a name" do
    body_area = BodyArea.create

    expect(body_area).to be_invalid
  end

  it "must have a unique name" do
    body_area1 = BodyArea.create(name: "Legs")
    body_area2 = BodyArea.create(name: "Legs")

    expect(body_area1).to be_valid
    expect(body_area2).to be_invalid
  end
end
