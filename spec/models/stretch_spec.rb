require 'rails_helper'

RSpec.describe Stretch do
  context "it is valid with all the necessary information" do
    it "it has all the information" do
      stretch1 = Stretch.create(name: "Standing Hamstring Stretch",
                            description: "Fun!",
                            picture: "https://media1.popsugar-assets.com/files/thumbor/V79mWjf6Xjup28tDXPGzoWBUVcU/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/03/12/2/192/1922729/2a8d7475eae1d6a3_propped-up-hamstring-stretch/i/Standing-Hamstring-Stretch.jpg")

      expect(stretch1).to be_valid
    end
  end

  context "it is invalid without infomation: " do
    it "is invalid without a name" do
      stretch1 = Stretch.new(description: "Fun!",
                            picture: "https://media1.popsugar-assets.com/files/thumbor/V79mWjf6Xjup28tDXPGzoWBUVcU/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/03/12/2/192/1922729/2a8d7475eae1d6a3_propped-up-hamstring-stretch/i/Standing-Hamstring-Stretch.jpg")

      expect(stretch1).to be_invalid
    end

    it "is invalid without a description" do
      stretch1 = Stretch.new(name: "Standing Hamstring Stretch",
                            picture: "https://media1.popsugar-assets.com/files/thumbor/V79mWjf6Xjup28tDXPGzoWBUVcU/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/03/12/2/192/1922729/2a8d7475eae1d6a3_propped-up-hamstring-stretch/i/Standing-Hamstring-Stretch.jpg")

      expect(stretch1).to be_invalid
    end

    it "is invalid without a picture" do
      stretch1 = Stretch.new(name: "Standing Hamstring Stretch",
                            description: "Fun!")

      expect(stretch1).to be_invalid
    end
  end
end
