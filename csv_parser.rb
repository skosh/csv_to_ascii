require 'csv'
require_relative 'converter'

class CsvParser
  ALIGNMENT_MAPPING = { 'int' => :right, 'money' => :right }
  CONVERTER_MAPPING = {
    'int' => Converter::Integer,
    'string' => Converter::String,
    'money' => Converter::Money
  }

  def initialize(file_name)
    @file_name = file_name
  end

  def each
    io = CSV.open(@file_name, headers: :true, converters: [converter], col_sep: ';')
    io.each do |row_with_headers|
      row = row_with_headers.map(&:last)
      yield(row)
    end
  ensure
    io.close if io
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