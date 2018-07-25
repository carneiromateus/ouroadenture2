class ImageEvents< ApplicationRecord
	belongs_to :event
	
  	has_attached_file :url, styles: { original: "x", medium: "x250", small: "200x200"}, :default_url => "logo_comp_preto.png"
  	do_not_validate_attachment_file_type :url
end
