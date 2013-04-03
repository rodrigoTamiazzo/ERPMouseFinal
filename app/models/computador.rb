class Computador < ActiveRecord::Base
  attr_accessible :cpu, :numero_serial, :garantia, :hd, :host_name, :memoria, :nome, :status, :data_de_compra


  
end
