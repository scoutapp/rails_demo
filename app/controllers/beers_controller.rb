class BeersController < ApplicationController
  before_action :set_beer, only: [:show]

  # GET /beers
  # GET /beers.json
  def index
    @beers = Beer.all
  end

  # GET /beers/1
  # GET /beers/1.json
  def show
    @reviews = Review.where(beer_id: @beer)
    @events = @beer.events
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = Beer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:brewarydb_id)
    end
end
