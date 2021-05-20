class DeckCardsController < ApplicationController
  before_action :set_deck_card, only: [:show, :update, :destroy]

  # GET /deck_cards
  def index
    @deck_cards = DeckCard.all

    render json: @deck_cards
  end

  # GET /deck_cards/1
  def show
    render json: @deck_card
  end

  # POST /deck_cards
  def create
    @deck_card = DeckCard.new(deck_card_params)

    if @deck_card.save
      render json: @deck_card, status: :created, location: @deck_card
    else
      render json: @deck_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /deck_cards/1
  def update
    if @deck_card.update(deck_card_params)
      render json: @deck_card
    else
      render json: @deck_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /deck_cards/1
  def destroy
    @deck_card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck_card
      @deck_card = DeckCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deck_card_params
      params.require(:deck_card).permit(:deck_id, :card_id, :quantity)
    end
end
