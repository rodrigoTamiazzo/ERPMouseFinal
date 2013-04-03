class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.references :usuario_requisitante
      
      t.string :status
      t.string :descricao
      t.string :prioridade
      t.string :atendente
      t.timestamp :data_abertura
      t.timestamp :data_fechamento

      

      t.timestamps
    end
  end
end
