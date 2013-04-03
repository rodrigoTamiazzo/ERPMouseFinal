class CreateLicencaDeSoftwares < ActiveRecord::Migration
  def change
    create_table :licenca_de_softwares do |t|
      t.string :numero_da_licenca
      t.string :produto
      t.integer :quantidade
      t.date :data_de_expiracao
      t.string :valor_de_compra
      t.string :status
      t.date :data_de_compra
      t.references :usuarioativo

      t.timestamps
    end
  end
end
