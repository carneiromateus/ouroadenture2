class Event < ApplicationRecord
	has_many :image_events, dependent: :destroy
	has_many :director 

	def to_param
		"#{id} #{title}".parameterize
	end
end
