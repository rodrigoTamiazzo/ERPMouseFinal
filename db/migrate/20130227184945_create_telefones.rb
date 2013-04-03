class CreateTelefones < ActiveRecord::Migration
  def change
    create_table :telefones do |t|
      t.string :numero_serial
      t.string :marca
      t.string :modelo
      t.string :garantia
      t.string :nome
      t.string :status
      t.date :data_de_compra

      t.references :usuarioativo

      t.timestamps
    end
  end
end
