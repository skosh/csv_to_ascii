module Converter
  class Unknown
    def initialize(_)
    end

    def convert
      raise "Unknown column type"
    end
  end
end
