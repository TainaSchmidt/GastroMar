class Usuario < ApplicationRecord
  # Diz ao Rails que o nome da tabela é 'usuario'
  self.table_name = "usuario"
  
  
  # Define a chave primária customizada
  self.primary_key = "id_usuario"

  has_many :pescados, foreign_key: "id_usuario", dependent: :destroy
end
