require 'rails_helper'

RSpec.describe Manufacturer, :type => :model do

  before do
    @manufacturer = Manufacturer.new
  end

  subject { @manufacturer }

  it { should respond_to(:name) }

  describe "when name is blank" do
    before { @manufacturer.name = " " }
    it { should be_invalid }
  end

  describe "when name is too long" do
    before { @manufacturer.name = "a" * 31 }
    it { should be_invalid }
  end
end
