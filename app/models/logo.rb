class Logo < ApplicationRecord
	has_attached_file :image, styles: { original: "x64"}
  	do_not_validate_attachment_file_type :image

  	has_attached_file :favi, styles: { original: "16X16"}
  	do_not_validate_attachment_file_type :favi
end
