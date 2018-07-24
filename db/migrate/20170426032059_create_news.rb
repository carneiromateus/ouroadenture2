class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :link
      t.text :description
      t.references :user, index: true, foreign_key: true
      t.text :subtitle
      t.text :short_description
      t.string :legend
      t.string :duration
      t.string :address
      t.float :value
      t.string :dates
      t.datetime :publish_at
      t.timestamps null: false
    end
  end
end
