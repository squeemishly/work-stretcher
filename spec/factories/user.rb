FactoryGirl.define do
  factory :user do
    sequence :username do |i|
      "squee #{i}"
    end
    password "password"
    sequence :email do |i|
      "squee#{i}@squee.com"
    end
    role 0
  end
end
