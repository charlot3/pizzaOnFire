require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  def setup
    @order = Order.new(oid: "81", orderprice: "36", ordercount: "1", paytype: "1",
                       ucount: "0", uid: "73", uname: "1")
  end
end
