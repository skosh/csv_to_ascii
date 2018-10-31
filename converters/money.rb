module Converter
  class Money
    def initialize(value)
      @precision, @scale = precision_and_scale(value)
    end

    def convert
      [converted_precision, converted_scale].join(',')
    end

    private

    def converted_precision
      @precision.reverse.gsub(/.{3}(?=.)/, '\0 ').reverse
    end

    def converted_scale
      "%02d" % @scale
    end

    def precision_and_scale(value)
      value.to_f.round(2).to_s.split('.')
    end
  end
end