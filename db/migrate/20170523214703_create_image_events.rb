class CreateImageEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :image_events do |t|
    	t.attachment :url
	    t.references :events, index: true, foreign_key: true

      	t.timestamps
    end
  end
end
