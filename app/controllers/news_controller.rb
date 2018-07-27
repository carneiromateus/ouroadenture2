class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.json
  def index
    @news = News.all
  end
  
  # GET /news/1
  # GET /news/1.json
  def show
    @more_news = News.where.not(id: @news.id).order("RANDOM()").limit(3)
    @activities = Director.all

  end

  # GET /news/new
  def new
    @news = News.new
    @activities = Director.all
  end

  # GET /news/1/edit
  def edit
    @activities = Director.all
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)
    if user_signed_in?
      @news.user = current_user
    end
              puts params

    if params[:directors]
      params[:directors].each { |director|
        d = Director.find(director)
        @news.director << d
        puts d
        puts@news.director_ids

      }
    end
    puts @news.save!
    if params.has_key?(:images)
      respond_to do |format|

        if @news.save
          if params[:images]
            params[:images].each { |image|
                @news.image_news.create(url: image)
            }
          end

          format.html { redirect_to @news, notice: 'News was successfully created.' }
          format.json { render :show, status: :created, location: @news }
        else
          format.html { render :new }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
                    puts @news.director_ids

        if @news.save 
            format.html { redirect_to @news, notice: 'News was successfully created.' }
            format.json { render :show, status: :created, location: @news }
        else
          format.html { render :new }
          format.json { render json: @news.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)

        if params[:images] and not params[:images].empty?
          @news_images = @news.image_news
          @news_images.destroy_all

          params[:images].each { |image|
              @news.image_news.create(url: image)
          }
        end

        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        respond_to do |format|
          if @news.save 
              format.html { redirect_to @news, notice: 'News was successfully created.' }
              format.json { render :show, status: :created, location: @news }
          else
            format.html { render :new }
            format.json { render json: @news.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.unscoped.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:dates, :title, :legend, :duration, :address, :value, :link, :description, :user_id, :subtitle, :video_url, :short_description, director_ids: [])
    end
end
