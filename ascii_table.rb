require_relative 'ascii_table/render'
require_relative 'ascii_table/row'

class AsciiTable
  attr_reader :rows, :columns_widths

  def initialize
    @columns_widths = []
    @rows = []
  end

  def add_row(array)
    row = Row.new(array)
    @rows << row
    update_columns_widths(row)
  end

  def to_s
    Render.new(rows, columns_widths).render
  end

  private

  def update_columns_widths(row)
    row.cells.each_with_index do |cell, column_number|
      cell_width = cell.width
      column_width = columns_widths[column_number] || 0

      if cell_width > column_width
        columns_widths[column_number] = cell_width
      end
    end
  end
end