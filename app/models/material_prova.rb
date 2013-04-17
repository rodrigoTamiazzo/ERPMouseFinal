class MaterialProva < ActiveRecord::Base
  attr_accessible :custo, :data, :descricao, :quantidade, :tipo
  validates_presence_of :custo, :data, :quantidade, :tipo, :message => "Campo = e necessario"
end
