class CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]

  # GET /cards

  def search
    if params[:card][:term]
      if params[:card][:term] == 'default'
        @cards = Card.default_search
      else
        @cards = Card.search(params[:card])
      end
    else

    end

    render json: (@cards)
  end

  def index
    @cards = Card.all

    render json: @cards
  end

  # GET /cards/1
  def show
    render json: @card
  end



  # DELETE /cards/1
  def destroy
    card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      card = Card.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :multiverse_id)
    end
end
