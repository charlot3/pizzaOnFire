require 'test_helper'

class RefundControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get refund_new_url
    assert_response :success
  end

end
