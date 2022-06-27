class DecksController < ApplicationController

  def index
    @decks = Deck.all
    render json: @decks
  end

  def search
    if params[:deck][:term]
      if params[:deck][:term] == 'default'
        @decks = Deck.default_search
      end
    end
    render json: DeckSerializer.new(@decks).serialized_json
  end

  def show
    @deck = Deck.by_id(params[:id])
    render json: DeckSerializer.new(@deck).serialized_json
  end

  def create
    # if params[:cards].size == 0
    #   render json: {error: {message:"Deck submitted with no cards"}} and return
    # end

    authenticate_user!
    @user = current_user

    @deck = Deck.new(
      name: params[:name],
      format_id: Format.find_or_create_by(name: params[:formatName]).id,
      user_id: decode_token["user_id"],
      creator: params[:creator]
    )

    if @deck.save
      params[:cards].each do |card|
        new_deck_card = DeckCard.new(
          deck_id: @deck.id,
          card_id: card[:card_id] || Card.find_by(name: card[:name]).id,
          card_quantity: card[:count] == '' ?  1 : card[:count],
          sideboard: card[:sideboard]
        )
        new_deck_card.save
      end
      @deck.save
      @deck = Deck.joins(:format, :user).where(id: @deck.id).select('decks.*, formats.name AS format_name, users.name AS user_name').references(:format, :user)[0]
      render json: DeckSerializer.new(@deck).serialized_json and return
    else
      render json: {message: "Failed to create deck", error: @deck.errors}
    end
  end

  def update
    authenticate_user!
    if @current_user_id = jwt_payload['id']
      original_deck_cards = DeckCard.where(deck_id: params[:id])
      new_deck_cards = params[:cards]
      ids_to_destroy = original_deck_cards.map{|c| c[:id]} - new_deck_cards.map{|c| c[:id]}.compact
      deck_cards_to_delete =
      deck_cards_to_add = new_deck_cards.select{|c| c[:id] == nil}
      if ids_to_destroy.length > 0
        DeckCard.where(id: ids_to_destroy).destroy_all
      end

      if deck_cards_to_add.length > 0
        card_errors =  Card.validate_card_names(deck_cards_to_add)
        if card_errors.length > 0
          render json: {error: {message:"Some card names are incorrect", keys: card_errors}} and return
        end
        deck_cards_to_add.each do |c|
          @deck_card = DeckCard.new(
                  deck_id: params[:id],
                  sideboard: c[:sideboard],
                  card_quantity: c[:count] == '' ?  1 : c[:count],
                  card_id: Card.find_by(name: c[:name]).id
                )
          @deck_card.save
        end
      end

      @deck = Deck.by_id(params[:id])
      @deck.save
      render json: DeckSerializer.new(@deck).serialized_json
    end
  end

  def destroy
    @deck = Deck.by_id(params[:id])
    if @deck.destroy
      render json: {message: "#{@deck.name} deleted", user: current_user}
    else
      render json: {message:"Something went wrong"}
    end
  end

end