require 'test_helper'

class ArcivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @arcife = arcives(:one)
  end

  test "should get index" do
    get arcives_url
    assert_response :success
  end

  test "should get new" do
    get new_arcife_url
    assert_response :success
  end

  test "should create arcife" do
    assert_difference('Arcive.count') do
      post arcives_url, params: { arcife: { name: @arcife.name, start_time: @arcife.start_time } }
    end

    assert_redirected_to arcife_url(Arcive.last)
  end

  test "should show arcife" do
    get arcife_url(@arcife)
    assert_response :success
  end

  test "should get edit" do
    get edit_arcife_url(@arcife)
    assert_response :success
  end

  test "should update arcife" do
    patch arcife_url(@arcife), params: { arcife: { name: @arcife.name, start_time: @arcife.start_time } }
    assert_redirected_to arcife_url(@arcife)
  end

  test "should destroy arcife" do
    assert_difference('Arcive.count', -1) do
      delete arcife_url(@arcife)
    end

    assert_redirected_to arcives_url
  end
end
