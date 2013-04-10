#encoding: utf-8 
class Material < ActiveRecord::Base
  attr_accessible :custo, :data_requisicao, :descricao, :quantidade, :tipo

  validates_presence_of :custo, :data_requisicao, :descricao, :quantidade, :tipo,:message => " = Não foi preenchido"

end
