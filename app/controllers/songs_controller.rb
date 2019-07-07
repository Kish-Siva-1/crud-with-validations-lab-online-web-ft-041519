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

  def create
      @song = Song.create(params[:songs])
    if
      @song = Song.create(params[:songs])
      redirect_to song_path(@song)
  end

end
