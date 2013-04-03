class Resposta < ActiveRecord::Base
  attr_accessible :datacriacao, :datafinalizacao, :descricao, :responsavel, :chamado_id
  belongs_to :chamado
end
