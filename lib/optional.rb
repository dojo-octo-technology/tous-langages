class Optional
  def self.from_value value
    new value
  end

  def initialize value
    @value = value
  end

  def value
    @value
  end

  def and_then
    return self if @value == nil
    yield @value
  end

  def method_missing method, *args, &block
    and_then { |value| Optional.from_value value.send(method, *args, &block) }
  end
end
