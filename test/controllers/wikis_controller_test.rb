require 'test_helper'

class WikisControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get wikis_new_url
    assert_response :success
  end

  test "should get show" do
    get wikis_show_url
    assert_response :success
  end

end
