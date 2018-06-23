class Oficina < ApplicationRecord
	has_attached_file :image, styles: { original: "1024x1024", medium: "500x500", small: "200x200"}
  	do_not_validate_attachment_file_type :image
  	has_and_belongs_to_many :categories

	 def self.search(parameters)
	   oficina_query = self.scoped
	   parameters.each do |parameter, value|
	     if not value.empty? and event_query.respond_to? parameter
	       oficina_query = oficina_query.send(parameter, value) 
	     end
	   end
	   oficina_query
	 end
end
