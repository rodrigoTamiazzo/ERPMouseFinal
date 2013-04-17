class CreateCelulars < ActiveRecord::Migration
  def change
    create_table :celulars do |t|
      t.string :numeroSerial
      t.string :garantia
      t.string :modelo
      t.string :estadoUso
      t.date :dataCompra

      t.timestamps
    end
  end
end
