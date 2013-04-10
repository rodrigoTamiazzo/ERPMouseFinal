class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :tipo
      t.string :custo
      t.timestamp :data_requisicao
      t.string :descricao
      t.string :quantidade

      t.timestamps
    end
  end
end
