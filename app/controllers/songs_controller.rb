class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
    if @song.update(params[:songs])
      redirect_to song_path(@song)
    else
      render :edit
    end  
  end

  def create
    @song = Song.new(params[:songs])
    if
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end



end
