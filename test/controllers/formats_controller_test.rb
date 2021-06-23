require "test_helper"

class FormatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @format = formats(:one)
  end

  test "should get index" do
    get formats_url, as: :json
    assert_response :success
  end

  test "should create format" do
    assert_difference('Format.count') do
      post formats_url, params: { format: { name: @format.name } }, as: :json
    end

    assert_response 201
  end

  test "should show format" do
    get format_url(@format), as: :json
    assert_response :success
  end

  test "should update format" do
    patch format_url(@format), params: { format: { name: @format.name } }, as: :json
    assert_response 200
  end

  test "should destroy format" do
    assert_difference('Format.count', -1) do
      delete format_url(@format), as: :json
    end

    assert_response 204
  end
end
