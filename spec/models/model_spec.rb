require 'rails_helper'

RSpec.describe Model, :type => :model do

  before do
    @model = Model.new(year: "2014", name: "SLR01",
                        manufacturer: create(:manufacturer))
  end

  subject { @model }

  it { should respond_to(:year) }
  it { should respond_to(:name) }

  it { should be_valid }

  describe "when year is blank" do
    before { @model.year = nil }
    it { should be_invalid }
  end

  describe "when year is invalid" do
    it "should be invalid" do
      years = ["eight", 0, 12, 747, 1800, 10500, 1.year.from_now + 2]
      years.each do |invalid_year|
        @model.year = invalid_year
        expect(@model).to be_invalid
      end
    end
  end

  describe "when year is valid" do
    it "should be valid" do
      years = [1817, 1989, 2000, 2014]
      years.each do |valid_year|
        @model.year = valid_year
        expect(@model).to be_valid
      end
    end
  end

  describe "when name is blank" do
    before { @model.name = " " }
    it { should be_invalid }
  end

  describe "when name is too long" do
    before { @model.name = "a" * 21 }
    it { should be_invalid }
  end

  describe "when manufacturer is blank" do
    before { @model.manufacturer = nil }
    it { should be_invalid }
  end

  describe "when manufacturer is invalid" do
    before { @model.manufacturer = Manufacturer.new }
    it { should be_invalid }
  end

  describe "sizes" do
    let(:size) { create(:size) }

    before do
      @model.save
      @model.sizes << size
    end

    describe "assigning a size" do
      specify { expect(@model.sizes.count).to eq 1 }
    end

    describe "assigning a duplicate size" do
      it "raises an error" do
        expect {
          @model.sizes << size
        }.to raise_error(ActiveRecord::RecordNotUnique)
      end
    end
  end
end
