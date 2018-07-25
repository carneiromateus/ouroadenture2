class CreateDirectors < ActiveRecord::Migration[5.0]
  def change
    create_table :directors do |t|
    	t.attachment :image
    	t.string :name
    	t.text :description
    	t.timestamps
    end
  end
end
