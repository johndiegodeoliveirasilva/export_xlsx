require 'byebug'
require 'spreadsheet'
require_relative 'connection'
require_relative 'export_xls'

client = Connection.new.open
resultQuery = client.query("SELECT clientes.id, 
                                   clientes.nome, 
                                   clientes.email01, 
                                   clientes.telefone01, 
                                   clientes.telefone02 
                            FROM `clientes` 
                            INNER JOIN `atendimentosite_clientes` 
                            ON `atendimentosite_clientes`.`cliente_id` = `clientes`.`id` 
                            INNER JOIN `atendimentosites` 
                            ON `atendimentosites`.`id` = `atendimentosite_clientes`.`atendimentosite_id` 
                            WHERE `atendimentosites`.`id` = 720597")

################################# Export XLSX

columns = resultQuery.first.keys
ExportXls.new(columns, resultQuery, 'batatinha').process
