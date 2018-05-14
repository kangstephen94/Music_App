class AlbumsController < ApplicationController

  def index
    @albums = Albums.all
    render :index
  end
end
