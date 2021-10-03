class ExportXls
  attr_accessor :columns, :query, :file_name, :row
  
  def initialize(columns, query, file_name)
    @columns = columns
    @query = query
    @file_name = String(file_name)
    @row = []
  end

  def process
    export
  end

  private

  def export
    Spreadsheet.client_encoding = 'UTF-8'
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet
    sheet.row(0).concat(columns)
    query.each_with_index do |val, index|
      row.push(sheet.row(index + 1).push(*val.values))
    end
    puts "Write XLS!"
    write(book)
  end

  def write(book)
    book.write "#{file_name}.xls"
    puts "Export Done."
  end
end
