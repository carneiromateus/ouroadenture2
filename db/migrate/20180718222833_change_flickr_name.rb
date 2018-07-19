class ChangeFlickrName < ActiveRecord::Migration[5.0]
  def change
  end

  def self.up
    rename_column :logo, :flickr, :whatsApp
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
