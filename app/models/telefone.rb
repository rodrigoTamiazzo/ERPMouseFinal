<<<<<<< HEAD
#encoding: utf-8 
=======
>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8
class Telefone < ActiveRecord::Base
  attr_accessible :garantia, :numero_serial, :marca, :modelo, :status, :data_de_compra


<<<<<<< HEAD
 validates_presence_of :garantia, :numero_serial, :marca, :modelo, :status, :data_de_compra,:message => " = Não foi preenchido"
=======
>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8

end
