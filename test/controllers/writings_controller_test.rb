require 'test_helper'

class WritingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get writings_new_url
    assert_response :success
  end

  test "should get show" do
    get writings_show_url
    assert_response :success
  end

end
