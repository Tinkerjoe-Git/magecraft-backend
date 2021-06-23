class CardMtgSetsController < ApplicationController
  before_action :set_card_mtg_set, only: [:show, :update, :destroy]

  # GET /card_mtg_sets
  def index
    @card_mtg_sets = CardMtgSet.all

    render json: @card_mtg_sets
  end

  # GET /card_mtg_sets/1
  def show
    render json: @card_mtg_set
  end

  # POST /card_mtg_sets
  def create
    @card_mtg_set = CardMtgSet.new(card_mtg_set_params)

    if @card_mtg_set.save
      render json: @card_mtg_set, status: :created, location: @card_mtg_set
    else
      render json: @card_mtg_set.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /card_mtg_sets/1
  def update
    if @card_mtg_set.update(card_mtg_set_params)
      render json: @card_mtg_set
    else
      render json: @card_mtg_set.errors, status: :unprocessable_entity
    end
  end

  # DELETE /card_mtg_sets/1
  def destroy
    @card_mtg_set.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card_mtg_set
      @card_mtg_set = CardMtgSet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_mtg_set_params
      params.require(:card_mtg_set).permit(:card_id, :mtg_set_id)
    end
end
