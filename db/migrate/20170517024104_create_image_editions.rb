class CreateImageEditions < ActiveRecord::Migration[5.0]
  def change
    create_table :image_editions do |t|
    	t.attachment :url
	    t.references :edition, index: true, foreign_key: true

    	t.timestamps
    end
  end
end
