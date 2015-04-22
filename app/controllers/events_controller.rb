class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.order("time DESC")
    pop = Art.all.sort {|a,b| a.events.size <=> b.events.size}.reverse
    @popular = pop[0..4]
  end

  def list
    if !logged_in?
      redirect_to root_path
    end
    @events = Event.all.order("time DESC")
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @count = 0
  end

  # GET /events/new
  def new
    if !logged_in?
      redirect_to root_path
    end
    @event = Event.new
    @art = Art.new
    @artist = Artist.new
  end

  # GET /events/1/edit
  def edit
    if !logged_in?
      redirect_to root_path
    end
    @art = Art.new
    @artist = Artist.new
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    artists = params[:artist_name]
    artwork = params[:artwork_name]

    if (artists != nil)
      artists.each do |artist|
        railsArtist = Artist.find_by(name: artist)
        if !@event.artists.include?(railsArtist)
          @event.artists.push(railsArtist)
        end
      end
    end

    if (artwork != nil)
      artwork.each do |artwork|
        railsArtwork = Art.find_by(name: artwork)
        if !@event.arts.include?(railsArtwork)
          @event.arts.push(railsArtwork)
        end
      end
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    artists = params[:artist_name]
    artwork = params[:artwork_name]

    @event.artists.clear
    if (artists != nil)
      artists.each do |artist|
        railsArtist = Artist.find_by(name: artist)
        if !@event.artists.include?(railsArtist) 
          @event.artists.push(railsArtist)
        end
      end
    end

    @event.arts.clear
    if (artwork != nil)
      artwork.each do |artwork|
        railsArtwork = Art.find_by(name: artwork)
        if !@event.arts.include?(railsArtwork)
          @event.arts.push(railsArtwork)
        end
      end
    end

    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
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
      params.require(:event).permit(:title, :location, :about, :history, :poster, :time, :end_time)
    end
end
