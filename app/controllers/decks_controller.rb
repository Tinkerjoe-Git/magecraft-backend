class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :update, :destroy]

  def index
      @decks = Deck.all

      render json: @decks, only: [:name, :id], include: {
          cards: {
              except: [:created_at, :updated_at]
          }
      }
  end

  # GET /decks/1
  def show
    render json: @deck, only: [:name, :id], include: {
        cards: {
            except: [:created_at, :updated_at]
        }
    }
  end

  # POST /decks
  def create
    @deck = Deck.new(deck_params)

    if @deck.save
      render json: {
        status: 201,
        deck: @deck
      }, status: :created, location: deck_path(@deck)
    else
      render json: {
        status: 422,
        errors: @deck.errors.full_messages.join(", ")
      }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /decks/1
  def update
    if @deck.update(deck_params)
      render json: {
        status: 204,
        deck: @deck
      }
    else
      render json: {
        status: 400,
        errors: @deck.errors.full_messages.join(", ")
      }, status: :unprocessable_entity
    end
  end

  # DELETE /decks/1
  def destroy
    if @deck.destroy
      render json: {message: "Successfully deleted", deck: @deck}
    else
      render json: {message: "Failed to delete"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deck
      @deck = Deck.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deck_params
      params.require(:deck).permit(:name)
    end
end
