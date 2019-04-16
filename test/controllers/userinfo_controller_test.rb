require 'test_helper'

class UserinfoControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get userinfo_new_url
    assert_response :success
  end

end
