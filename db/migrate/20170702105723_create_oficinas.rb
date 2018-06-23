class CreateOficinas < ActiveRecord::Migration[5.0]
  def change
    create_table :oficinas do |t|
      t.string :name
      t.string :descripton
      t.float :value
      t.datetime :start_at
      t.datetime :finish_at
      t.integer :vacancies

      t.timestamps
    end
  end
end
