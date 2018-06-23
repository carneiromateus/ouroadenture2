class AddCategoriesOficinasJoinTable < ActiveRecord::Migration[5.0]
  def self.up
    create_table :categories_oficinas, :id => false do |t|
      t.integer :category_id
      t.integer :oficina_id
    end
  end
 
  def self.down
    drop_table :categories_oficinas
  end
end
