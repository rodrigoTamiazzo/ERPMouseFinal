<<<<<<< HEAD
#encoding: utf-8 
=======
>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8
class Resposta < ActiveRecord::Base
  attr_accessible :datacriacao, :datafinalizacao, :descricao, :responsavel, :chamado_id
  belongs_to :chamado
end
