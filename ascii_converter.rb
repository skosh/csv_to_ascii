require_relative 'ascii_table'
require_relative 'csv_parser'

class AsciiConverter
  PARSER_MAPPING = { csv: CsvParser }
  def initialize(file: , parser: :csv)
    @file = file
    @parser = PARSER_MAPPING.fetch(parser, nil)
    raise "Unknown parser. Availables are #{PARSER_MAPPING.keys}" unless @parser
  end

  def convert
    ascii_table = AsciiTable.new

    @parser.new(@file).each do |row|
      ascii_table.add_row(row)
    end

    puts ascii_table
  end
end