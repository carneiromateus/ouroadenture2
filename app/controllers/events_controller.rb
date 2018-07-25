class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    @activities = Director.all

  end


  # GET /events/1/edit
  def edit
    @activities = Director.all
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    if params.has_key?(:images)
      respond_to do |format|
        if @event.save

          if params[:images]
            params[:images].each { |image|
              @event.image_events.create(url: image)
            }
          end

          format.html { redirect_to @event, notice: 'event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        if @event.save 
            format.html { redirect_to @event, notice: 'event was successfully created.' }
            format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)

        if params[:images] and not params[:images].empty?
          @event_images = @event.image_events
          @event_images.destroy_all

          params[:images].each { |image|
              @event.image_events.create(url: image)
          }
        end

        format.html { redirect_to @events, notice: 'events was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        respond_to do |format|
          if @events.save 
              format.html { redirect_to @event, notice: 'events was successfully created.' }
              format.json { render :show, status: :created, location: @events }
          else
            format.html { render :new }
            format.json { render json: @event.errors, status: :unprocessable_entity }
          end
        end
      end
    end
    
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:dates, :title, :legend, :duration, :address, :value, :link, :description, :user_id, :subtitle, :video_url, :short_description, director_ids: [])
    end
end
