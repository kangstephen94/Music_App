class BandsController < ApplicationController
  def index
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = ['Must specify a band name']
      redirect_to new_band_url
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = ['Please specify a band']
      render :edit
    end

  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete
    redirect_to bands_url
  end



  private

  def band_params
    params.require(:band).permit(:name)
  end



end
