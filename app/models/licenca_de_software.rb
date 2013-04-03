class LicencaDeSoftware < ActiveRecord::Base
  attr_accessible :data_de_expiracao, :numero_da_licenca, :produto, :quantidade, :valor_de_compra, :status, :data_de_compra

end
