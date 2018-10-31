class AsciiTable
  class Render
    WIDTH_BORDER = '|'.freeze
    LENGTH_BORDER = '-'.freeze
    CROSS_BORDER = '+'.freeze
    SPACE = " ".freeze

    attr_reader :rows, :columns_widths

    def initialize(rows, columns_widths)
      @rows = rows
      @columns_widths = columns_widths
    end

    def render
      rows_lines = rows.map { |row| row_lines(row) }
      rows_lines.product([separator]).unshift(separator).flatten.join("\n")
    end

    private

    def row_lines(row)
      Array(0..row.hight-1).map do |line_index|
        row.cells.map do |cell|
          render_cell_line(cell, line_index) + WIDTH_BORDER
        end.join.prepend(WIDTH_BORDER)
      end
    end

    def render_cell_line(cell, index)
      value = cell.lines[index].to_s

      spaces = SPACE * (columns_widths[cell.column] - value.to_s.size)

      case cell.alignment
      when :left
        value + spaces
      when :right
        spaces + value
      end
    end

    def separator
      @separator ||= begin
        columns_widths.map do |width|
          LENGTH_BORDER * width + CROSS_BORDER
        end.join.prepend(CROSS_BORDER)
      end
    end
  end
end