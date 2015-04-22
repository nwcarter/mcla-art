class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update, :destroy]

  # GET /arts
  # GET /arts.json
  def index
    @arts = Art.all
  end

  # GET /arts/1
  # GET /arts/1.json
  def show
  end

  def gallery
    @arts = Art.all
    @count = 0
  end

  # GET /arts/new
  def new
    @art = Art.new
  end

  def get_ajax
    arts = Art.all.order("name")
    render :json => arts
  end

  # GET /arts/1/edit
  def edit
    @name = ""
    art = Art.find(params[:id])
    if art.artists != nil
      @name = art.artists[0].name
    end
  end

  # POST /arts
  # POST /arts.json
  def create
    @art = Art.new(art_params)

    if params[:artist] != nil && params[:artist] != "None"
      artist = Artist.find_by(name: params[:artist])
      @art.artists.push(artist)
    end

    respond_to do |format|
      if @art.save
        format.html { redirect_to @art, notice: 'Art was successfully created.' }
        format.json { render :show, status: :created, location: @art }
      else
        format.html { render :new }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /arts/1
  # PATCH/PUT /arts/1.json
  def update

    @art.artists.clear
    if params[:artist] != nil && params[:artist] != "None"
      artist = Artist.find_by(name: params[:artist])
      @art.artists.push(artist)
    end
    
    respond_to do |format|
      if @art.update(art_params)
        format.html { redirect_to @art, notice: 'Art was successfully updated.' }
        format.json { render :show, status: :ok, location: @art }
      else
        format.html { render :edit }
        format.json { render json: @art.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /arts/1
  # DELETE /arts/1.json
  def destroy
    @art.destroy
    respond_to do |format|
      format.html { redirect_to arts_url, notice: 'Art was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_art
      @art = Art.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def art_params
      params.require(:art).permit(:name, :image)
    end
end
