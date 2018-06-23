class AddSizeToSponsors < ActiveRecord::Migration[5.0]
  def change
    add_column :sponsors, :size, :boolean
  end
end
