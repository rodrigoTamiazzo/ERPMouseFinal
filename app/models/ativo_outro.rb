<<<<<<< HEAD
#encoding: utf-8 
class AtivoOutro < ActiveRecord::Base
  attr_accessible :descricao, :garantia, :nome, :status, :data_de_compra

 validates_presence_of :descricao, :garantia, :nome, :status, :data_de_compra,:message => " = Não foi preenchido"
=======
class AtivoOutro < ActiveRecord::Base
  attr_accessible :descricao, :garantia, :nome, :status, :data_de_compra

 
>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8
end
