class CreateMaterialProvas < ActiveRecord::Migration
  def change
    create_table :material_provas do |t|
      t.float :custo
      t.date :data
      t.text :descricao
      t.integer :quantidade
      t.string :tipo

      t.timestamps
    end
  end
end
