class News < ApplicationRecord
	default_scope { where("publish_at <= ?", DateTime.now) }

	belongs_to :user
	has_many :image_news, dependent: :destroy

	validates :description, :title, :publish_at, presence: true
	validates :title, :length => { :maximum => 180 }
	validates :subtitle, :length => { :maximum => 180 }




	def to_param
		"#{id} #{title}".parameterize
	end
end
