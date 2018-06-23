class ImageEdition < ApplicationRecord
	belongs_to :edition
	
  	has_attached_file :url, styles: { original: "1024x1024", medium: "500x500", small: "200x200"}, :default_url => "logo_comp_preto.png"
  	do_not_validate_attachment_file_type :url
end
