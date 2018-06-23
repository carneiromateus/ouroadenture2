class AddLocationToOficinas < ActiveRecord::Migration[5.0]
  def change
    add_column :oficinas, :location, :string
  end
end
