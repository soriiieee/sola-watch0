require 'test_helper'

class SatelightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @satelight = satelights(:one)
  end

  test "should get index" do
    get satelights_url
    assert_response :success
  end

  test "should get new" do
    get new_satelight_url
    assert_response :success
  end

  test "should create satelight" do
    assert_difference('Satelight.count') do
      post satelights_url, params: { satelight: { name1: @satelight.name1, name2: @satelight.name2, name3: @satelight.name3 } }
    end

    assert_redirected_to satelight_url(Satelight.last)
  end

  test "should show satelight" do
    get satelight_url(@satelight)
    assert_response :success
  end

  test "should get edit" do
    get edit_satelight_url(@satelight)
    assert_response :success
  end

  test "should update satelight" do
    patch satelight_url(@satelight), params: { satelight: { name1: @satelight.name1, name2: @satelight.name2, name3: @satelight.name3 } }
    assert_redirected_to satelight_url(@satelight)
  end

  test "should destroy satelight" do
    assert_difference('Satelight.count', -1) do
      delete satelight_url(@satelight)
    end

    assert_redirected_to satelights_url
  end
end
