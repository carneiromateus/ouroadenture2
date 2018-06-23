class Slide < ApplicationRecord
	has_attached_file :image, styles: { original: "1177x432"}
  	do_not_validate_attachment_file_type :image

  	validates_presence_of :title, :subtitle
end
