require 'csv'
require 'pry'
require 'terminal-table'
require_relative 'converters/integer'
require_relative 'converters/string'
require_relative 'converters/money'
require_relative 'converters/unknown'

class CsvToAscii
  ALIGNMENT_MAPPING = { 'int' => :right, 'money' => :right }
  CONVERTER_MAPPING = {
    'int' => Converter::Integer,
    'string' => Converter::String,
    'money' => Converter::Money
  }

  def initialize(file_name)
    @file_name = file_name
  end

  def convert
    csv_io = CSV.open(@file_name, headers: :true, converters: [converter], col_sep: ';')
    ascii_table = Terminal::Table.new(style: { all_separators: true })

    csv_io.each do |row_with_headers|
      row = row_with_headers.map(&:last)
      ascii_table.add_row(row)
    end

    puts ascii_table
  ensure
    csv_io.close if csv_io
  end

  private

  def converter
    lambda do |value, field_info|
      header = field_info.header
      converter = CONVERTER_MAPPING.fetch(header, Converter::Unknown)
      alignment = ALIGNMENT_MAPPING.fetch(header, :left)

      { value: converter.new(value).convert, alignment: alignment }
    end
  end
end