# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130417181128) do

  create_table "ativo_outros", :force => true do |t|
    t.string   "nome"
    t.string   "status"
    t.date     "data_de_compra"
    t.string   "descricao"
    t.string   "garantia"
    t.integer  "usuarioativo_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "chamados", :force => true do |t|
    t.integer  "usuario_requisitante_id"
    t.string   "status"
    t.string   "descricao"
    t.string   "prioridade"
    t.string   "atendente"
    t.datetime "data_abertura"
    t.datetime "data_fechamento"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "computadors", :force => true do |t|
    t.string   "status"
    t.string   "nome"
    t.string   "host_name"
    t.date     "data_de_compra"
    t.string   "memoria"
    t.string   "cpu"
    t.string   "numero_serial"
    t.string   "hd"
    t.string   "garantia"
    t.integer  "usuarioativo_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "licenca_de_softwares", :force => true do |t|
    t.string   "numero_da_licenca"
    t.string   "produto"
    t.integer  "quantidade"
    t.date     "data_de_expiracao"
    t.string   "valor_de_compra"
    t.string   "status"
    t.date     "data_de_compra"
    t.integer  "usuarioativo_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "material_provas", :force => true do |t|
    t.float    "custo"
    t.date     "data"
    t.text     "descricao"
    t.integer  "quantidade"
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "materials", :force => true do |t|
    t.string   "tipo"
    t.string   "custo"
    t.datetime "data_requisicao"
    t.string   "descricao"
    t.string   "quantidade"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "respostas", :force => true do |t|
    t.integer  "chamado_id"
    t.string   "responsavel"
    t.text     "descricao"
    t.datetime "datacriacao"
    t.datetime "datafinalizacao"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "respostas", ["chamado_id"], :name => "index_respostas_on_chamado_id"

  create_table "telefones", :force => true do |t|
    t.string   "numero_serial"
    t.string   "marca"
    t.string   "modelo"
    t.string   "garantia"
    t.string   "nome"
    t.string   "status"
    t.date     "data_de_compra"
    t.integer  "usuarioativo_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "roles_mask"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
