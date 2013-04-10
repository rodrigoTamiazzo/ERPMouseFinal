<<<<<<< HEAD
#encoding: utf-8 
=======
>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8
class Chamado < ActiveRecord::Base
  attr_accessible :atendente, :data_abertura, :data_fechamento, :descricao, :prioridade, :status

  has_many :respostas
<<<<<<< HEAD
  validates_presence_of :atendente, :data_abertura, :descricao, :prioridade, :status,:message => " = Não foi preenchido"
=======
  
>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8
end