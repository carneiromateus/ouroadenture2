class MidiaController < ApplicationController
  before_action :set_midium, only: [:show, :edit, :update, :destroy]

  # GET /midia
  # GET /midia.json
  def index
    @midia = Midium.all
  end

  # GET /midia/1
  # GET /midia/1.json
  def show
  end

  # GET /midia/new
  def new
    @midium = Midium.new
  end

  # GET /midia/1/edit
  def edit
  end

  # POST /midia
  # POST /midia.json
  def create
    @midium = Midium.new(midium_params)

    respond_to do |format|
      if @midium.save
        format.html { redirect_to @midium, notice: 'Midium was successfully created.' }
        format.json { render :show, status: :created, location: @midium }
      else
        format.html { render :new }
        format.json { render json: @midium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /midia/1
  # PATCH/PUT /midia/1.json
  def update
    respond_to do |format|
      if @midium.update(midium_params)
        format.html { redirect_to @midium, notice: 'Midium was successfully updated.' }
        format.json { render :show, status: :ok, location: @midium }
      else
        format.html { render :edit }
        format.json { render json: @midium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /midia/1
  # DELETE /midia/1.json
  def destroy
    @midium.destroy
    respond_to do |format|
      format.html { redirect_to midia_url, notice: 'Midium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_midium
      @midium = Midium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def midium_params
      params.require(:midium).permit(:title, :link, :publish_by, :publish_at, :local)
    end
end
