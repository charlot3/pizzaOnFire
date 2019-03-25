require 'test_helper'

class ManageControllerTest < ActionDispatch::IntegrationTest
  test "should get new manage" do
    get manage_new_url
    assert_response :success
  end

end
