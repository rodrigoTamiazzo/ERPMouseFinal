class Celular < ActiveRecord::Base
  attr_accessible :dataCompra, :estadoUso, :garantia, :modelo, :numeroSerial
end
