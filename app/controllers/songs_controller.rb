class SongsController < ApplicationController
  before_action :set_artist
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  def index
    @songs = @artist.songs
  end

  def show
  end

  def new
    @song = @artist.songs.new
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      flash[:success] =  "Song: Created"
      redirect_to artist_songs_path(@artist)
    else
      flash[:error] = "Error #{@song.errors.full_messages.join("\n")}"
      render :new
    end
  end

  def edit
  end

  def update
    if @song.update(song_params)
      flash[:success] =  "Song: #{@song.title} Updated"
      redirect_to artist_songs_path(@artist)
    else
      flash[:error] = "Error #{@song.errors.full_messages.join("\n")}"
      render :edit
    end
  end

  def destroy
    @song.destroy
    flash[:success] =  "Song: #{@song.title} Deleted"
    redirect_to artist_songs_path(@artist)
  end

  private 
    def set_artist
      @artist = Artist.find(params[:artist_id])
    end

    def set_song
      @song = @artist.songs.find(params[:id])
    end

    def song_params
      params.require(:song).permit(:title, :album)
    end
end
