class AlbumsController < ApplicationController
  before_action :set_album, only: %i[ show update destroy ]
  before_action :authorize_logged_in
  before_action :authorize_admin, only: %i[ destroy ]

  # GET /albums
  def index
    @albums = Album.all
    render json: @albums, status: 200
  end

  # GET /albums/1
  def show
    render json: @album
  end

  # POST /albums
  def create
    @album = Album.new(album_params)

    if @album.save
      render json: @album, status: 201, location: @album
    else
      render json: @album.errors, status: 500
    end
  end

  # PATCH/PUT /albums/1
  def update
    if @album.update(album_params)
      render json: @album
    else
      render json: @album.errors, status: 422
    end
  end

  # DELETE /albums/1
  def destroy
    @album.destroy
    render json: {"message": "deleted", "album": @album}, status: 200
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def album_params
      params.require(:album).permit(:artist_id, :album_name, :year)
    end
end
