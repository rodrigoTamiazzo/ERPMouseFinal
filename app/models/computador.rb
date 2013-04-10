<<<<<<< HEAD
#encoding: utf-8 
class Computador < ActiveRecord::Base
  attr_accessible :cpu, :numero_serial, :garantia, :hd, :host_name, :memoria, :nome, :status, :data_de_compra

  validates_presence_of :cpu, :numero_serial, :garantia, :hd, :host_name, :memoria, :nome, :status, :data_de_compra,:message => " = Não foi preenchido"
=======
class Computador < ActiveRecord::Base
  attr_accessible :cpu, :numero_serial, :garantia, :hd, :host_name, :memoria, :nome, :status, :data_de_compra


  
>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8
end
