class CreateComputadors < ActiveRecord::Migration
  def change
    create_table :computadors do |t|
      t.string :status 
      t.string :nome
      t.string :host_name
      t.date :data_de_compra
      t.string :memoria
      t.string :cpu
      t.string :numero_serial 
      t.string :hd
      t.string :garantia

      t.references :usuarioativo

      t.timestamps
    end
  end
end
