class CreateImageNews < ActiveRecord::Migration[5.0]
  def change
    create_table :image_news do |t|
    	t.attachment :url
	    t.references :news, index: true, foreign_key: true

      	t.timestamps
    end
  end
end
