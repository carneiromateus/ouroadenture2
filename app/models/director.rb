class Director < ApplicationRecord
	has_attached_file :image, styles: { original: "200x200"}
  	do_not_validate_attachment_file_type :image

  	validates_presence_of :name, :link
end
