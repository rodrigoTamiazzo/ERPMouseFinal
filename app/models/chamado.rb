#encoding: utf-8 
class Chamado < ActiveRecord::Base
  attr_accessible :atendente, :data_abertura, :data_fechamento, :descricao, :prioridade, :status

  has_many :respostas
  validates_presence_of :atendente, :data_abertura, :descricao, :prioridade, :status,:message => " = Não foi preenchido"
end