class Chamado < ActiveRecord::Base
  attr_accessible :atendente, :data_abertura, :data_fechamento, :descricao, :prioridade, :status

  has_many :respostas
  
end