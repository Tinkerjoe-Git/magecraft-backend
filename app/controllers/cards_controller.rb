class CardsController < ApplicationController
  before_action :set_card, only: [:show, :update, :destroy]

  # GET /cards
  def index
    @cards = Card.all

    render json: CardSerializer.new(@cards).serializable_hash
  end

  # GET /cards/1
  def show
    render json: @card
  end

  # POST /cards
  # def create
  #   @card = Card.new(card_params)

  #   if @card.save
  #     render json: @card, status: :created, location: @card
  #   else
  #     render json: @card.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /cards/1
  def update
    if @card.update(card_params)
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cards/1
  def destroy
    @card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def card_params
      params.require(:card).permit(:name, :text, :power, :toughness, :cmc, :rarity, :card_type, :artist, :colors, :set, :flavor, :mana_cost, :image_url, :loyalty, :collection_id)
    end
end
