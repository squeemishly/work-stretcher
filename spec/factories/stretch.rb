FactoryGirl.define do
  factory :stretch do
    sequence :name do |i|
      "Standing Hamstring Stretch #{i}"
    end
    description "Stand, then stretch your hamstrings"
    picture "https://media1.popsugar-assets.com/files/thumbor/V79mWjf6Xjup28tDXPGzoWBUVcU/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2013/03/12/2/192/1922729/2a8d7475eae1d6a3_propped-up-hamstring-stretch/i/Standing-Hamstring-Stretch.jpg"
  end
end
