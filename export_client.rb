require 'byebug'
require 'spreadsheet'
require_relative 'connection'


client = Connection.new.open
resultQuery = client.query("SELECT `clientes`.* FROM `clientes` INNER JOIN `atendimentosite_clientes` ON `atendimentosite_clientes`.`cliente_id` = `clientes`.`id` INNER JOIN `atendimentosites` ON `atendimentosites`.`id` = `atendimentosite_clientes`.`atendimentosite_id` WHERE `atendimentosites`.`id` = 720597")

################################# Export XLSX

Spreadsheet.client_encoding = 'UTF-8'

book = Spreadsheet::Workbook.new
sheet1 = book.create_worksheet

sheet1.row(0).concat %w{ID NOME EMAIL TEL01 TEL02}

@row = []
resultQuery.each_with_index do |val, index|
  byebug
  @row.push(sheet1.row(index + 1).push(val["id"], val["nome"], val["email01"], val["telefone01"], val["telfone02"]))
end
## Write the Excel File
book.write('excel-file.xls')