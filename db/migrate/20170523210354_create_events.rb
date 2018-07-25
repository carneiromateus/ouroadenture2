class CreateEvents < ActiveRecord::Migration[5.0]
	def change
		create_table :events do |t|

			t.string :title
			t.string :link
			t.text :description
			t.text :subtitle
			t.text :short_description
			t.string :legend
			t.string :duration
			t.string :address
			t.float :value
			t.string :dates
			t.timestamps null: false
		end
	end
end
