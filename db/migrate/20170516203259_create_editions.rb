class CreateEditions < ActiveRecord::Migration[5.0]
  def change
    create_table :editions do |t|
      t.string :title
      t.datetime :year
      t.string :local
      t.string :tema
      t.text :description

      t.timestamps
    end
  end
end
