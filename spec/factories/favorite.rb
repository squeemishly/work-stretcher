FactoryGirl.define do
  factory :favorite do
    user
    stretch
    notes "This is the best!"
  end
end
