class News < ApplicationRecord
	belongs_to :user
	has_many :image_news, dependent: :destroy
	has_many :director 
	
	validates :description, :title, presence: true
	validates :title, :length => { :maximum => 180 }
	validates :subtitle, :length => { :maximum => 180 }

	def to_param
		"#{id} #{title}".parameterize
	end
end
