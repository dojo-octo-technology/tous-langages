require_relative "../lib/optional"

RSpec.describe Optional do
  describe ".from_value, .value" do
    specify "when it has a value (13)" do
      optional = Optional.from_value 13
      expect(optional.value).to eq 13
    end

    specify "when it has a value ('abc')" do
      optional = Optional.from_value 'abc'
      expect(optional.value).to eq 'abc'
    end

    specify "when it has no value" do
      optional = Optional.from_value nil
      expect(optional.value).to be_nil
    end
  end

  describe ".and_then" do
    specify "when it has a value (3)" do
      optional = Optional.from_value 3
      expect(optional.and_then { |n| Optional.from_value n + 5 }.value).to eq 8
    end

    specify "when it has a value (5)" do
      optional = Optional.from_value 5
      expect(optional.and_then { |n| Optional.from_value n + 7 }.value).to eq 12
    end

    specify "when it has no value" do
      optional = Optional.from_value nil
      expect(optional.and_then { |n| Optional.from_value n + 7 }.value).to be_nil
    end
  end

  describe ".method_missing" do
    specify "when it has a value ('abc')" do
      optional = Optional.from_value 'abc'
      expect(optional.upcase.value).to eq 'ABC'
    end

    specify "when it has no value" do
      optional = Optional.from_value nil
      expect(optional.upcase.value).to eq nil
    end
  end
end

# car
#   .try(:rear_door)
#   .try(:window)
#   .try(:wipers)
#   .try(:serial_no)

# Optional.from_value(car)
#   .rear_door
#   .window
#   .wipers
#   .serial_no
#   .value
