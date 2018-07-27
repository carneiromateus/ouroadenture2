class AddDirectorIdToNews < ActiveRecord::Migration[5.0]
  def change
    add_column :news, :director_id, :integer
  end
end
