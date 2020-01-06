require 'test_helper'

class SolagramControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get solagram_index_url
    assert_response :success
  end

  test "should get show" do
    get solagram_show_url
    assert_response :success
  end

end
