<<<<<<< HEAD
#encoding: utf-8 
class Material < ActiveRecord::Base
  attr_accessible :custo, :data_requisicao, :descricao, :quantidade, :tipo

  validates_presence_of :custo, :data_requisicao, :descricao, :quantidade, :tipo,:message => " = Não foi preenchido"

=======
class Material < ActiveRecord::Base
  attr_accessible :custo, :data_requisicao, :descricao, :quantidade, :tipo

  
>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8
end
