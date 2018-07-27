class AddEdiitionIdToDirector < ActiveRecord::Migration[5.0]
  def change
    add_column :directors, :edition_id, :integer
  end
end
