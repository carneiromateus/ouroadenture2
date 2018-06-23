class CreateSponsors < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsors do |t|
    	t.attachment :image
    	t.string :name
    	t.string :link
        t.integer :order
      	t.timestamps
    end
  end
end
