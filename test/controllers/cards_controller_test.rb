require "test_helper"

class CardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card = cards(:one)
  end

  test "should get index" do
    get cards_url, as: :json
    assert_response :success
  end

  test "should create card" do
    assert_difference('Card.count') do
      post cards_url, params: { card: { artist: @card.artist, card_type: @card.card_type, cmc: @card.cmc, collection_id: @card.collection_id, colors: @card.colors, flavor: @card.flavor, image_url: @card.image_url, loyalty: @card.loyalty, mana_cost: @card.mana_cost, name: @card.name, power: @card.power, rarity: @card.rarity, set: @card.set, text: @card.text, toughness: @card.toughness } }, as: :json
    end

    assert_response 201
  end

  test "should show card" do
    get card_url(@card), as: :json
    assert_response :success
  end

  test "should update card" do
    patch card_url(@card), params: { card: { artist: @card.artist, card_type: @card.card_type, cmc: @card.cmc, collection_id: @card.collection_id, colors: @card.colors, flavor: @card.flavor, image_url: @card.image_url, loyalty: @card.loyalty, mana_cost: @card.mana_cost, name: @card.name, power: @card.power, rarity: @card.rarity, set: @card.set, text: @card.text, toughness: @card.toughness } }, as: :json
    assert_response 200
  end

  test "should destroy card" do
    assert_difference('Card.count', -1) do
      delete card_url(@card), as: :json
    end

    assert_response 204
  end
end
