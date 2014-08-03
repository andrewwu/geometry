require 'rails_helper'

RSpec.describe Manufacturer, :type => :model do

  before do
    @manufacturer = Manufacturer.new(name: "BMC")
  end

  subject { @manufacturer }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is already taken" do
    before do
      manufacturer_with_same_name = @manufacturer.dup
      manufacturer_with_same_name.save
    end
    it { should be_invalid }
  end

  describe "when name is blank" do
    before { @manufacturer.name = " " }
    it { should be_invalid }
  end

  describe "when name is too long" do
    before { @manufacturer.name = "a" * 31 }
    it { should be_invalid }
  end

  describe "model associations" do
    let(:model) { create(:model, manufacturer: @manufacturer) }

    specify { expect(@manufacturer.models).to include(model) }

    it "destroys the associated models" do
      models = @manufacturer.models
      @manufacturer.destroy
      expect(models).to be_empty
    end
  end
end
