class Pescado < ApplicationRecord
  self.primary_key = "id_pescado"
  
  # Cria a relação dizendo que o pescado pertence a um usuário
  # Usando a coluna 'id_usuario' como a chave estrangeira (FK)
  belongs_to :usuario, foreign_key: "id_usuario"
end
