class Event < ApplicationRecord
	has_attached_file :image, styles: { original: "1024x1024", medium: "500x500", small: "200x200"}
  	do_not_validate_attachment_file_type :image
  	has_and_belongs_to_many :categories

	 def self.search(parameters)
	   event_query = self.scoped
	   parameters.each do |parameter, value|
	     if not value.empty? and event_query.respond_to? parameter
	       event_query = event_query.send(parameter, value) 
	     end
	   end
	   event_query
	 end
end
