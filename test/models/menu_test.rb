require 'test_helper'

class MenuTest < ActiveSupport::TestCase
  def setup
    @menu = Menu.new(fid: "1", fcid: "admin", fname: "多重浓芝比萨")
  end

  test "should be valid" do
    assert @menu.valid?
  end

end
