class DrinkHistoriesController < ApplicationController
  before_action :set_drink_history, only: [:show, :edit, :update, :destroy]

  # GET /drink_histories
  # GET /drink_histories.json
  def index
    @drink_histories = DrinkHistory.first(100)
  end

  # GET /drink_histories/1
  # GET /drink_histories/1.json
  def show
  end

  # GET /drink_histories/new
  # def new
  #   @drink_history = DrinkHistory.new
  # end

  # # GET /drink_histories/1/edit
  # def edit
  # end

  # # POST /drink_histories
  # # POST /drink_histories.json
  # def create
  #   @drink_history = DrinkHistory.new(drink_history_params)

  #   respond_to do |format|
  #     if @drink_history.save
  #       format.html { redirect_to @drink_history, notice: 'Drink history was successfully created.' }
  #       format.json { render :show, status: :created, location: @drink_history }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @drink_history.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /drink_histories/1
  # # PATCH/PUT /drink_histories/1.json
  # def update
  #   respond_to do |format|
  #     if @drink_history.update(drink_history_params)
  #       format.html { redirect_to @drink_history, notice: 'Drink history was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @drink_history }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @drink_history.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /drink_histories/1
  # # DELETE /drink_histories/1.json
  # def destroy
  #   @drink_history.destroy
  #   respond_to do |format|
  #     format.html { redirect_to drink_histories_url, notice: 'Drink history was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drink_history
      @drink_history = DrinkHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def drink_history_params
      params.require(:drink_history).permit(:user_id, :beer_id)
    end
end
