class CreateMidia < ActiveRecord::Migration[5.0]
  def change
    create_table :midia do |t|
    	t.string :title
      	t.string :link
      	t.string :publish_by
      	t.string :local
      	t.datetime :publish_at
    	t.timestamps
    end
  end
end
