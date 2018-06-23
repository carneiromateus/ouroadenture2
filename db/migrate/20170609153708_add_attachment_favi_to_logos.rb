class AddAttachmentFaviToLogos < ActiveRecord::Migration
  def self.up
    change_table :logos do |t|
      t.attachment :favi
    end
  end

  def self.down
    remove_attachment :logos, :favi
  end
end
