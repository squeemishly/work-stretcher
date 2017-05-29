require 'rails_helper'

RSpec.describe Favorite do
  it "has relationships to user and stretch" do
    favorite = create(:favorite)

    expect(favorite).to respond_to(:user)
    expect(favorite).to respond_to(:stretch)
  end
end
