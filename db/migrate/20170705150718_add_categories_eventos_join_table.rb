class AddCategoriesEventosJoinTable < ActiveRecord::Migration[5.0]
  def self.up
    create_table :categories_eventos, :id => false do |t|
      t.integer :category_id
      t.integer :evento_id
    end
  end
 
  def self.down
    drop_table :categories_eventos
  end
end
