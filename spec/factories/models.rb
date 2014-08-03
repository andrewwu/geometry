FactoryGirl.define do
  factory :model do
    year { Time.now.year }
    name "SLR01"
    manufacturer
  end
end