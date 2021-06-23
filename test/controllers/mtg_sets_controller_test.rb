require "test_helper"

class MtgSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mtg_set = mtg_sets(:one)
  end

  test "should get index" do
    get mtg_sets_url, as: :json
    assert_response :success
  end

  test "should create mtg_set" do
    assert_difference('MtgSet.count') do
      post mtg_sets_url, params: { mtg_set: { code: @mtg_set.code, name: @mtg_set.name, release_date: @mtg_set.release_date } }, as: :json
    end

    assert_response 201
  end

  test "should show mtg_set" do
    get mtg_set_url(@mtg_set), as: :json
    assert_response :success
  end

  test "should update mtg_set" do
    patch mtg_set_url(@mtg_set), params: { mtg_set: { code: @mtg_set.code, name: @mtg_set.name, release_date: @mtg_set.release_date } }, as: :json
    assert_response 200
  end

  test "should destroy mtg_set" do
    assert_difference('MtgSet.count', -1) do
      delete mtg_set_url(@mtg_set), as: :json
    end

    assert_response 204
  end
end
