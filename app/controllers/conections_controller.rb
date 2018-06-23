class ConectionsController < ApplicationController
  before_action :set_conection, only: [:show, :edit, :update, :destroy]

  # GET /conections
  # GET /conections.json
  def index
    @conections = Conection.all
  end

  # GET /conections/1
  # GET /conections/1.json
  def show
  end

  # GET /conections/new
  def new
    @conection = Conection.new
  end

  # GET /conections/1/edit
  def edit
  end

  # POST /conections
  # POST /conections.json
  def create
    @conection = Conection.new(conection_params)

    respond_to do |format|
      if @conection.save
        format.html { redirect_to @conection, notice: 'Conection was successfully created.' }
        format.json { render :show, status: :created, location: @conection }
      else
        format.html { render :new }
        format.json { render json: @conection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conections/1
  # PATCH/PUT /conections/1.json
  def update
    respond_to do |format|
      if @conection.update(conection_params)
        format.html { redirect_to @conection, notice: 'Conection was successfully updated.' }
        format.json { render :show, status: :ok, location: @conection }
      else
        format.html { render :edit }
        format.json { render json: @conection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conections/1
  # DELETE /conections/1.json
  def destroy
    @conection.destroy
    respond_to do |format|
      format.html { redirect_to conections_url, notice: 'Conection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conection
      @conection = Conection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conection_params
      params.require(:conection).permit(:title, :description)
    end
end
