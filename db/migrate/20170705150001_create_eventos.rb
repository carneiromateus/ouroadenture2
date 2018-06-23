class CreateEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :eventos do |t|
		t.string :name
      	t.string :description
      	t.string :location
      	t.datetime :publish_at
      	t.datetime :date_end
      	t.attachment :image
      	t.timestamps
    
    end
  end
end
