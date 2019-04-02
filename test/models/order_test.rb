require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = Order.new(oid: "81", orderprice: "36", ordercount: "1", paytype: "1",
                       ucount: "0", uid: "73", uname: "1")
  end

  test "should be valid" do
    assert @order.valid?
  end

end
