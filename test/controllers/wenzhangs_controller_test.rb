require 'test_helper'

class WenzhangsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wenzhangs_new_url
    assert_response :success
  end

  test "should get show" do
    get wenzhangs_show_url
    assert_response :success
  end

end
