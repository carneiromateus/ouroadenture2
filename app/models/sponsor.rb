class Sponsor < ApplicationRecord
	has_attached_file :image
  	do_not_validate_attachment_file_type :image

  	validates_presence_of :name, :link
end
