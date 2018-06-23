class Edital < ApplicationRecord
  	belongs_to :user

  	has_attached_file :pdf
  	validates_presence_of :name, :date_end, :descricao, :date_published, :tipo_edital
  	validate :date_end_greather_date_start, :date_start_greather_date_publish

  	validates_attachment :pdf, presence: true,
        size: {less_than: 12.megabytes},
        content_type: {content_type: ['text/plain',
                                      "application/pdf",               
                                      "application/vnd.ms-excel",
                                      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                      "application/msword",
                                      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]}

  	def date_end_greather_date_start
    	if date_end < date_start
      		errors.add(:date_end, "Data de fim não pode ser menor do que a data de início") 
    	end
  	end

  	def date_start_greather_date_publish
    	if date_start < date_published
      		errors.add(:date_start, "Data de início não pode ser menor do que a data de publicação")
    	end
  	end
end
