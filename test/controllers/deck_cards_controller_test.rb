require "test_helper"

class DeckCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deck_card = deck_cards(:one)
  end

  test "should get index" do
    get deck_cards_url, as: :json
    assert_response :success
  end

  test "should create deck_card" do
    assert_difference('DeckCard.count') do
      post deck_cards_url, params: { deck_card: { belongs_to: @deck_card.belongs_to, card_quantity: @deck_card.card_quantity, deck_id: @deck_card.deck_id, default: @deck_card.default, sideboard: @deck_card.sideboard } }, as: :json
    end

    assert_response 201
  end

  test "should show deck_card" do
    get deck_card_url(@deck_card), as: :json
    assert_response :success
  end

  test "should update deck_card" do
    patch deck_card_url(@deck_card), params: { deck_card: { belongs_to: @deck_card.belongs_to, card_quantity: @deck_card.card_quantity, deck_id: @deck_card.deck_id, default: @deck_card.default, sideboard: @deck_card.sideboard } }, as: :json
    assert_response 200
  end

  test "should destroy deck_card" do
    assert_difference('DeckCard.count', -1) do
      delete deck_card_url(@deck_card), as: :json
    end

    assert_response 204
  end
end
