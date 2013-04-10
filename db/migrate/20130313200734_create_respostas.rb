class CreateRespostas < ActiveRecord::Migration
  def change
    create_table :respostas do |t|
		t.references :chamado
		t.string :responsavel
      	t.text :descricao
      	t.datetime :datacriacao
    	t.datetime :datafinalizacao
		t.timestamps
    end
    add_index("respostas", "chamado_id")
  end
end
