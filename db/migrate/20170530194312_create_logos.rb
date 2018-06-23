class CreateLogos < ActiveRecord::Migration[5.0]
  def change
    create_table :logos do |t|
		t.string :name
		t.string :status
		t.string :facebook
		t.string :flickr
		t.string :instagram
		t.string :estaEdicaoTitle
		t.text :estaEdicaoDesc
		t.string :contatoEmail
		t.text :contatoEnd


      	t.timestamps
    end
  end
end
