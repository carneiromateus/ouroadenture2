class AddShortDescriptionToEdition < ActiveRecord::Migration[5.0]
  def change
    add_column :editions, :short_description, :text
  end
end
