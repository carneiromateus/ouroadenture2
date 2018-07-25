class Edition < ApplicationRecord

	has_many :image_edition, dependent: :destroy
	has_many :director 

	validates :description, :length => { :maximum => 1000 }

end
