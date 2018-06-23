class Category < ApplicationRecord
	has_and_belongs_to_many :events
	has_and_belongs_to_many :eventos
	has_and_belongs_to_many :oficinas

	def to_s
    	self.name
  	end
end
