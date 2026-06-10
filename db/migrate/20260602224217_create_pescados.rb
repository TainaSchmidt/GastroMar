class CreatePescados < ActiveRecord::Migration[8.1]
  def change
    create_table :pescados, id: false do |t|
      t.primary_key :id_pescado, :bigint

      t.string :nome, null: false
      t.decimal :quantidade, precision: 10, scale: 2, null: false
      t.string :unidade, null: false
      t.decimal :preco_por_unidade, precision: 10, scale: 2
      t.text :descricao
      t.boolean :disponivel, default: true
      t.date :data_pesca, null: false

      # Aqui criamos a chave estrangeira apontando para a tabela 'usuario' na coluna 'id_usuario'
      t.bigint :id_usuario, null: false

      t.timestamps
    end

    # Adiciona a restrição de chave estrangeira no banco de dados
    add_foreign_key :pescados, :usuario, column: :id_usuario, primary_key: :id_usuario, on_delete: :cascade
  end
end
