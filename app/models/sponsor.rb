class Sponsor < ApplicationRecord
	has_attached_file :image
	belongs_to :edition
	belongs_to :news
  	do_not_validate_attachment_file_type :image

  	validates_presence_of :name, :link
end
