class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :update, :destroy]

  # GET /decks
  def index
    decks = Deck.all

    render json: DeckSerializer.new(decks).serializable_hash, include: :cards
  end

  def show
    decks = Card.find_by(name: params[:Card_name]).decks

    render json: deckSerializer.new(decks.sample)
  end

  def create
    deck = Deck.new(deck_params)
    cards = params[:cards].map { |card| Card.find_by(id: params[:id]) }
    deck.cards << cards
    deck.save
    render json: DeckSerializer.new(deck)
  end


  # PATCH/PUT /decks/1
  def update
    if deck.update(deck_params)
      render json: deck
    else
      render json: deck.errors, status: :unprocessable_entity
    end
  end

  # DELETE /decks/1
  def destroy
    deck.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      deck = Deck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deck_params
      params.require(:deck).permit(:name)
    end
end
