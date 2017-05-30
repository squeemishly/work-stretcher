require 'rails_helper'

RSpec.describe Favorite do
  it "has relationships to user and stretch" do
    user = create(:user)
    stretch = create(:stretch)
    favorite = Favorite.create(user_id: user.id, stretch_id: stretch.id)

    expect(favorite).to respond_to(:user)
    expect(favorite).to respond_to(:stretch)
  end
end
