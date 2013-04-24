#encoding: utf-8 
class Computador < ActiveRecord::Base
  attr_accessible :cpu, :numero_serial, :garantia, :hd, :host_name, :memoria, :nome, :status, :data_de_compra

  validates_presence_of :cpu, :numero_serial, :garantia, :hd, :host_name, :memoria, :status, :data_de_compra,:message => " = Não foi preenchido"

end
