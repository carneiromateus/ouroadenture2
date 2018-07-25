class PagesController < ApplicationController
	skip_before_filter :authenticate_user!
  skip_before_filter :verify_authenticity_token  

	def home
		@news = News.all.order('created_at DESC').limit(2)
    @translates = Editions.all.limit(2)
		@slides = Slide.all
		@slides = Slide.all.order(order: :asc)
	end
    def noticias
    @news = News.order('publish_at DESC').paginate(page: params[:page], per_page: 9)
  end
  def noticia
    @news = News.find(params[:id])
    @activities = News.joins(:directors)

  end
  def edicoes
    @editions = Edition.all
  end
  def edicao
    @edition = Edition.find(params[:id]) 
    @activities = Director.joins(:edition)
  end

  def index
    @news = News.all.order('created_at DESC').limit(2)
    @translates = Edition.all.limit(2)
    @slides = Slide.all
  end



	def midia
    @last_year= DateTime.new(Time.zone.now.year, 1, 1)
 		@midia = Midium.where("publish_at > ?", @last_year).order('publish_at DESC').paginate(page: params[:page], per_page: 9)
	end
	def edital
		@edital = Edital.find(params[:id])
	end
 	def editais
  	@editals = Edital.where(tipo_edital: "Licitação" ).order("date_published DESC").paginate(page: params[:page], per_page: 10)
	end
	def evento
		# @event = Event.find(params[:id])
    @news = News.find(params[:id])
	end
	def eventos
  	@events = Event.all.order("publish_at ASC")
  	@categorias = Category.all
  	@date_start = Event.order("publish_at ASC").limit(1).first
  	@date_end = Event.order("date_end DESC").limit(1).first
    @news = News.order('created_at DESC').paginate(page: params[:page], per_page: 9)

  end
  def eventojm
		@event = Evento.find(params[:id])
	end
  	def eventosjm
    	@events = Evento.all.order("publish_at ASC")
    	@categorias = Category.all
    	@date_start = Evento.order("publish_at ASC").limit(1).first
    	@date_end = Evento.order("date_end DESC").limit(1).first

  end
	def editais_selecao
  	@editals = Edital.where(tipo_edital: "Seleção" ).order("date_published DESC").paginate(page: params[:page], per_page: 10)
	end
	
	def ofestival
		@current_year = Time.zone.now.year
	    @last_year= Time.zone.parse('<%= current_year %>-01-01 00:01')
 		@news = News.all
 		
	end
	def colaboradores
		@colaborator = Colaborator.first
	end
	def feiras
		@feira = Feira.first
	end
	def conections
		@conection = Feira.first
	end

	def oficinas
		@oficinas = Oficina.all.order("start_at ASC")
    	@categorias = Category.all
    	@date_start = Oficina.order("start_at ASC").limit(1).first
    	@date_end = Oficina.order("finish_at DESC").limit(1).first
	end
	def oficina
		@oficina = Oficina.find(params[:id])
	end
	def midia
 		@midias = Midium.all.order('publish_at DESC').paginate(page: params[:page], per_page: 15)
	end
	def inscricao
    @oficina = set_oficina()
    # name = params[:name]
    # cpf = params[:cpf]
    # email = params[:email] 
    # id = oficinaID   
    # if params[:value].to_i > 0
    # end
  end


  def pagamento
    @oficina = set_oficina()
    nome = params[:name]
    email = params[:email]
    cpf = params[:cpf]
    if @oficina.value > 0
            payment = PagSeguro::PaymentRequest.new(email: "festivaldeinverno@ufop.br", token: "6C4A261D7F31479088F086A394B317C4")
            payment.reference = "tretas"
            payment.notification_url = "http://wwww.festivaldeinverno.feop.com.br"
            payment.redirect_url = "http://wwww.festivaldeinverno.feop.com.br"
            payment.items << {
                id: @oficina.id,
                description: @oficina.name,
                amount: @oficina.value.to_i
              }
            payment.extra_params << { nomeInscrito: nome }
            payment.extra_params << { email: email }
             payment.extra_params << { cpf: cpf }
            response = payment.register
            if response.errors.any?
               redirect_to root_path
            else
              puts(response)
              redirect_to response.url
            end
    else
        require 'net/smtp'
         msg = "Subject: inscrição na oficina  #{@oficina.name}!!\n\n nome:#{nome}\n\n email: #{email} \n\n\n cpf: #{cpf}"
        smtp = Net::SMTP.new 'smtp.gmail.com', 587
        smtp.enable_starttls
        smtp.start('gmail.com', 'republicanotredame@gmail.com', "kygel69", :login) do
          smtp.send_message(msg, "festivalproex2017@gmail.com", "festivalproex2017@gmail.com")
        end
         redirect_to root_path
    end
  
  end
  def set_oficina
      @oficina = Oficina.find(params[:id])
  end
  
end
