# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_06_02_224217) do
  create_schema "extensions"

  # These are extensions that must be enabled in order to support this database
  enable_extension "extensions.pg_stat_statements"
  enable_extension "extensions.pgcrypto"
  enable_extension "extensions.uuid-ossp"
  enable_extension "pg_catalog.plpgsql"
  enable_extension "vault.supabase_vault"

  create_table "public.pescados", primary_key: "id_pescado", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "data_pesca", null: false
    t.text "descricao"
    t.boolean "disponivel", default: true
    t.bigint "id_usuario", null: false
    t.string "nome", null: false
    t.decimal "preco_por_unidade", precision: 10, scale: 2
    t.decimal "quantidade", precision: 10, scale: 2, null: false
    t.string "unidade", null: false
    t.datetime "updated_at", null: false
  end

  create_table "public.usuario", primary_key: "id_usuario", force: :cascade do |t|
    t.string "bairro", null: false
    t.string "cidade", null: false
    t.datetime "created_at", null: false
    t.string "nome", null: false
    t.string "senha_hash", null: false
    t.string "telefone", null: false
    t.string "tipo", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "public.pescados", "public.usuario", column: "id_usuario", primary_key: "id_usuario", on_delete: :cascade

end
