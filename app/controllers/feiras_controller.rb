class FeirasController < ApplicationController
  before_action :set_feira, only: [:show, :edit, :update, :destroy]

  # GET /feiras
  # GET /feiras.json
  def index
    @feiras = Feira.all
  end

  # GET /feiras/1
  # GET /feiras/1.json
  def show
  end

  # GET /feiras/new
  def new
    @feira = Feira.new
  end

  # GET /feiras/1/edit
  def edit
  end

  # POST /feiras
  # POST /feiras.json
  def create
    @feira = Feira.new(feira_params)

    respond_to do |format|
      if @feira.save
        format.html { redirect_to @feira, notice: 'Feira was successfully created.' }
        format.json { render :show, status: :created, location: @feira }
      else
        format.html { render :new }
        format.json { render json: @feira.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feiras/1
  # PATCH/PUT /feiras/1.json
  def update
    respond_to do |format|
      if @feira.update(feira_params)
        format.html { redirect_to @feira, notice: 'Feira was successfully updated.' }
        format.json { render :show, status: :ok, location: @feira }
      else
        format.html { render :edit }
        format.json { render json: @feira.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feiras/1
  # DELETE /feiras/1.json
  def destroy
    @feira.destroy
    respond_to do |format|
      format.html { redirect_to feiras_url, notice: 'Feira was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feira
      @feira = Feira.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feira_params
      params.require(:feira).permit(:title, :description)
    end
end
