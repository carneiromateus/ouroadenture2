class CreateSlides < ActiveRecord::Migration[5.0]
  def change
    create_table :slides do |t|
    	t.attachment :image
        t.string :title
        t.string :subtitle
        t.string :link
        t.integer :order
    	t.timestamps
    end
  end
end
