class CreateAtivoOutros < ActiveRecord::Migration
  def change
    create_table :ativo_outros do |t|
      t.string :nome
      t.string :status
      t.date :data_de_compra 
      t.string :descricao
      t.string :garantia

      t.references :usuarioativo

      t.timestamps
    end
  end
end
