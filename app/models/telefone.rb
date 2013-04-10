#encoding: utf-8 

class Telefone < ActiveRecord::Base
  attr_accessible :garantia, :numero_serial, :marca, :modelo, :status, :data_de_compra


 validates_presence_of :garantia, :numero_serial, :marca, :modelo, :status, :data_de_compra,:message => " = Não foi preenchido"


end
