FactoryGirl.define do
  factory :body_area do
    sequence :name do |i|
      "Legs #{i}"
    end
  end
end
