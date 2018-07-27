class Director < ApplicationRecord
	has_attached_file :image, styles: { original: "200x200"}
  	do_not_validate_attachment_file_type :image
  	has_and_belongs_to_many :news
  	has_and_belongs_to_many :edition

  	validates_presence_of :name, :description
end
