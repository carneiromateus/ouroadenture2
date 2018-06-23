class CreateEditals < ActiveRecord::Migration[5.0]
  def change
    create_table :editals do |t|
    	t.string :name
	    t.date :date_end
	   	t.date :date_start
	   	t.date :date_published
	    t.text :descricao
	    t.string :situacao
	    t.string :tipo_edital
	    t.references :user, index: true
	    t.attachment :pdf
    	t.timestamps
    end
  end
end
