require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get new order" do
    get orders_new_url
    assert_response :success
  end

end
