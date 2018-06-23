class Edition < ApplicationRecord

	has_many :image_edition, dependent: :destroy
  	validates :year,:tema, presence: true
	validates :tema, :length => { :maximum => 180 }
	validates :description, :length => { :maximum => 1000 }

end
