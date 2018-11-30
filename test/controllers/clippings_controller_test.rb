require 'test_helper'

class ClippingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @clipping = clippings(:one)
  end

  test "should get index" do
    get clippings_url, as: :json
    assert_response :success
  end

  test "should create clipping" do
    assert_difference('Clipping.count') do
      post clippings_url, params: { clipping: { date: @clipping.date, paragraph: @clipping.paragraph, source: @clipping.source, title: @clipping.title, url: @clipping.url } }, as: :json
    end

    assert_response 201
  end

  test "should show clipping" do
    get clipping_url(@clipping), as: :json
    assert_response :success
  end

  test "should update clipping" do
    patch clipping_url(@clipping), params: { clipping: { date: @clipping.date, paragraph: @clipping.paragraph, source: @clipping.source, title: @clipping.title, url: @clipping.url } }, as: :json
    assert_response 200
  end

  test "should destroy clipping" do
    assert_difference('Clipping.count', -1) do
      delete clipping_url(@clipping), as: :json
    end

    assert_response 204
  end
end
