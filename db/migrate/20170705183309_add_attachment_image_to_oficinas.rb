class AddAttachmentImageToOficinas < ActiveRecord::Migration
  def self.up
    change_table :oficinas do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :oficinas, :image
  end
end
