require_relative 'cell'

class AsciiTable
  class Row
    attr_reader :cells

    def initialize(cells_options)
      @cells = cells_options.map.with_index do |cell_options, column|
        cell_options[:column] = column
        Cell.new(cell_options)
      end
    end

    def columns_count
      @cells.count
    end

    def hight
      @cells.map(&:hight).max
    end
  end
end