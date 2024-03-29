require 'rails_helper'

RSpec.describe Size, :type => :model do
  before do
    @size = Size.new(frame_size: 480)
  end

  subject { @size }

  it { should respond_to(:frame_size) }
  it { should respond_to(:top_tube) }
  it { should respond_to(:head_tube) }
  it { should respond_to(:head_tube_angle) }
  it { should respond_to(:seat_tube) }
  it { should respond_to(:seat_tube_angle) }
  it { should respond_to(:bottom_bracket_drop) }
  it { should respond_to(:front_center) }
  it { should respond_to(:chainstay) }
  it { should respond_to(:fork_rake) }
  it { should respond_to(:trail) }
  it { should respond_to(:wheelbase) }
  it { should respond_to(:standover) }
  it { should respond_to(:stack) }
  it { should respond_to(:reach) }

  it { should be_valid }

  describe "when frame size is blank" do
    before { @size.frame_size = " " }
    it { should be_invalid }
  end

  describe "when frame size is invalid" do
    it "should be invalid" do
      frame_sizes = [0, "foobar", -5]
      frame_sizes.each do |invalid_size|
        @size.frame_size = invalid_size
        expect(@size).to be_invalid
      end
    end
  end

  describe "when frame size is valid" do
    it "should be valid" do
      frame_sizes = [480, 500, 520].each do |valid_size|
        @size.frame_size = valid_size
        expect(@size).to be_valid
      end
    end
  end

  Size::GEOMETRY_ATTRIBUTES.each do |attribute|
    describe "when #{attribute} less than or equal to zero" do
      it "should be invalid" do
        values = ["foobar", -88, 0]
        values.each do |invalid_value|
          @size.send("#{attribute}=".to_sym, invalid_value)
          expect(@size).to be_invalid
        end
      end
    end
  end

  describe "persistence" do
    before do
      @size.save
      @size.update_attributes(
        frame_size: 49,
        top_tube: 518,
        head_tube: 100,
        head_tube_angle: 72.25,
        seat_tube: 431,
        seat_tube_angle: 75.5,
        bottom_bracket_drop: 71.5,
        front_center: 576,
        chainstay: 405,
        fork_rake: 45,
        trail: 62,
        wheelbase: 970,
        standover: 730,
        stack: 504,
        reach: 386
      )
    end

    context "when size doesn't exist" do
    it "should be valid" do
      duplicate_size = @size.dup
      duplicate_size.reach = 350
      expect(duplicate_size).to be_valid
    end
    end

    context "when size already exists" do
      it "should be invalid" do
        duplicate_size = @size.dup
        expect(duplicate_size).to be_invalid
      end
    end
  end
end
