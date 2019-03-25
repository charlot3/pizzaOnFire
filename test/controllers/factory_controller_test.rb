require 'test_helper'

class FactoryControllerTest < ActionDispatch::IntegrationTest
  test "should get new factory" do
    get factory_new_url
    assert_response :success
  end

end
