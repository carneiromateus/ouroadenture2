class OficinasController < ApplicationController
  before_action :set_oficina, only: [:show, :edit, :update, :destroy]

  # GET /oficinas
  # GET /oficinas.json
  def index
    @oficinas = Oficina.all
  end

  # GET /oficinas/1
  # GET /oficinas/1.json
  def show
  end

  # GET /oficinas/new
  def new
    @oficina = Oficina.new
  end

  # GET /oficinas/1/edit
  def edit
  end

  # POST /oficinas
  # POST /oficinas.json
  def create
    @oficina = Oficina.new(oficina_params)

    respond_to do |format|
      if @oficina.save
        format.html { redirect_to @oficina, notice: 'Oficina was successfully created.' }
        format.json { render :show, status: :created, location: @oficina }
      else
        format.html { render :new }
        format.json { render json: @oficina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /oficinas/1
  # PATCH/PUT /oficinas/1.json
  def update
    respond_to do |format|
      if @oficina.update(oficina_params)
        format.html { redirect_to @oficina, notice: 'Oficina was successfully updated.' }
        format.json { render :show, status: :ok, location: @oficina }
      else
        format.html { render :edit }
        format.json { render json: @oficina.errors, status: :unprocessable_entity }
      end
    end
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
              redirect_to response.url
            end
    else
        require 'net/smtp'
         msg = "Subject: inscrição oficina!!\n\n nome:#{nome}\n\n email: #{email} \n\n\n cpf: #{cpf}"
        smtp = Net::SMTP.new 'smtp.gmail.com', 587
        smtp.enable_starttls
        smtp.start('gmail.com', 'republicanotredame@gmail.com', "kygel69", :login) do
          smtp.send_message(msg, "republicanotredame@gmail.com", "financeiro@republicanotredame.com")
        end
         redirect_to root_path
    end
  
  end
  # DELETE /oficinas/1
  # DELETE /oficinas/1.json
  def destroy
    @oficina.destroy
    respond_to do |format|
      format.html { redirect_to oficinas_url, notice: 'Oficina was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_oficina
      @oficina = Oficina.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def oficina_params
      params.require(:oficina).permit(:name, :descripton, :value, :start_at, :finish_at, {category_ids: []}, :vacancies)
    end
end
