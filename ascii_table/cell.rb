class AsciiTable
  class Cell
    attr_reader :lines, :alignment, :column

    def initialize(value:, column:, alignment: :left)
      @lines = Array(value)
      @alignment = alignment
      @column = column
    end

    def width
      lines.map(&:to_s).map(&:size).max
    end

    def hight
      lines.count
    end
  end
end