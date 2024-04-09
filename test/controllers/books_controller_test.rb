require "test_helper"

class BeersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get beers_show_url
    assert_response :success
  end

  test "should get edit" do
    get beers_edit_url
    assert_response :success
  end

  test "should get index" do
    get beers_index_url
    assert_response :success
  end
end
