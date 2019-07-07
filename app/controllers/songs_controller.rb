class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    binding.pry
    if @song.update(params.required(:song).permit(:title, :artist_name, :genre, :release_year, :released))
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def create
    @song = Song.new(params.required(:song).permit(:title, :artist_name, :genre, :release_year, :released))

    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  private

  def song_params
    params.required(:song).permit(:title, :artist_name, :genre, :release_year, :released)
  end

end
