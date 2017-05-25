require 'rails_helper'

RSpec.describe BodyArea do
  it "exists" do
    body_area = create(:body_area)

    expect(body_area).to be_valid
  end
end
