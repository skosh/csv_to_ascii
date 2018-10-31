module Converter
  class Integer
    def initialize(value)
      @value = value
    end

    def convert
      @value.to_i
    end
  end
end
