FactoryGirl.define do
  factory :model do
    year { Time.now.year }
    name "SLR01"
    manufacturer

    factory :model_with_sizes do
      after(:create) do |model|
        sizes = [create(:size, frame_size: 48), create(:size, frame_size: 50)]
        model.sizes = sizes
      end
    end
  end
end