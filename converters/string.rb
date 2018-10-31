module Converter
  class String
    def initialize(value)
      @value = value
    end

    def convert
      @value.split(/\s/)
    end
  end
end
