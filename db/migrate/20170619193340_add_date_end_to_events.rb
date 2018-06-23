class AddDateEndToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :date_end, :datetime
  end
end
