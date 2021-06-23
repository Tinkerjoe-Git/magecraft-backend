require "test_helper"

class CardMtgSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_mtg_set = card_mtg_sets(:one)
  end

  test "should get index" do
    get card_mtg_sets_url, as: :json
    assert_response :success
  end

  test "should create card_mtg_set" do
    assert_difference('CardMtgSet.count') do
      post card_mtg_sets_url, params: { card_mtg_set: { card_id: @card_mtg_set.card_id, mtg_set_id: @card_mtg_set.mtg_set_id } }, as: :json
    end

    assert_response 201
  end

  test "should show card_mtg_set" do
    get card_mtg_set_url(@card_mtg_set), as: :json
    assert_response :success
  end

  test "should update card_mtg_set" do
    patch card_mtg_set_url(@card_mtg_set), params: { card_mtg_set: { card_id: @card_mtg_set.card_id, mtg_set_id: @card_mtg_set.mtg_set_id } }, as: :json
    assert_response 200
  end

  test "should destroy card_mtg_set" do
    assert_difference('CardMtgSet.count', -1) do
      delete card_mtg_set_url(@card_mtg_set), as: :json
    end

    assert_response 204
  end
end
