require "test_helper"

class CardFormatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @card_format = card_formats(:one)
  end

  test "should get index" do
    get card_formats_url, as: :json
    assert_response :success
  end

  test "should create card_format" do
    assert_difference('CardFormat.count') do
      post card_formats_url, params: { card_format: { card_id: @card_format.card_id, format_id: @card_format.format_id, legality: @card_format.legality } }, as: :json
    end

    assert_response 201
  end

  test "should show card_format" do
    get card_format_url(@card_format), as: :json
    assert_response :success
  end

  test "should update card_format" do
    patch card_format_url(@card_format), params: { card_format: { card_id: @card_format.card_id, format_id: @card_format.format_id, legality: @card_format.legality } }, as: :json
    assert_response 200
  end

  test "should destroy card_format" do
    assert_difference('CardFormat.count', -1) do
      delete card_format_url(@card_format), as: :json
    end

    assert_response 204
  end
end
