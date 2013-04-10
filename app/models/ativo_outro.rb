#encoding: utf-8 
class AtivoOutro < ActiveRecord::Base
  attr_accessible :descricao, :garantia, :nome, :status, :data_de_compra

 validates_presence_of :descricao, :garantia, :nome, :status, :data_de_compra,:message => " = Não foi preenchido"
end
