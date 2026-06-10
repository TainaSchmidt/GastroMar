class CreateUsuarios < ActiveRecord::Migration[8.1]
  def change
    create_table :usuario, id: false do |t|
      t.primary_key :id_usuario, :bigint

      t.string :senha_hash, null: false
      t.string :tipo, null: false # O check constraint do tipo faremos direto no banco depois ou no model
      t.string :nome, null: false
      t.string :telefone, null: false
      t.string :bairro, null: false
      t.string :cidade, null: false

      t.timestamps
    end
  end
end
