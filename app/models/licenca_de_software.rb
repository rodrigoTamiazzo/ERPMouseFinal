<<<<<<< HEAD
#encoding: utf-8 
class LicencaDeSoftware < ActiveRecord::Base
  attr_accessible :data_de_expiracao, :numero_da_licenca, :produto, :quantidade, :valor_de_compra, :status, :data_de_compra

  validates_presence_of :data_de_expiracao, :numero_da_licenca, :produto, :quantidade, :valor_de_compra, :status, :data_de_compra,:message => " = Não foi preenchido"

=======
class LicencaDeSoftware < ActiveRecord::Base
  attr_accessible :data_de_expiracao, :numero_da_licenca, :produto, :quantidade, :valor_de_compra, :status, :data_de_compra

>>>>>>> 8e2910df577a1dcbbd3c7b951809aa9e9004efb8
end
