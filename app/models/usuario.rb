class Usuario < ApplicationRecord
  # Diz ao Rails que o nome da tabela é 'usuario' (no singular)
  self.table_name = "usuario"
  
  # Define a chave primária customizada
  self.primary_key = "id_usuario"
end
