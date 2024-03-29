class ArtistsController < ApplicationController
  before_action :set_billboard
  before_action :set_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = @billboard.artists
  end

  def show
  end

  def new
    @artist = @billboard.artists.new
  end

  def create
    @artist = @billboard.artists.new(artist_params)
    if @artist.save
      flash[:success] = "Artist Created"
      redirect_to billboard_artists_path(@billboard)
    else
      flash[:error] = "Error #{@artist.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
  end

  def update
    if @artist.update(artist_params)
      flash[:success] =  "Artist: #{@artist.name} Updated"
      redirect_to billboard_artists_path(@billboard)
    else
      flash[:error] = "Error #{@artist.errors.full_messages.join("\n")}"
      render :edit
    end
  end

  def destroy
    @artist.destroy
    flash[:success] =  "Artist: #{@artist.name} Deleted"
    redirect_to billboard_artists_path(@billboard)
  end

  private 
    def set_billboard
      @billboard = Billboard.find(params[:billboard_id])
    end

    def set_artist
      @artist = @billboard.artists.find(params[:id])
    end

    def artist_params
      params.require(:artist).permit(:name, :rank)
    end
end
