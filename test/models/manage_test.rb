require 'test_helper'

class ManageTest < ActiveSupport::TestCase
  def setup
    @manage = Manage.new(uid: "1", username: "admin", userpass: "172a792213d4fedd5b3c2012242cab15")
  end

  test "should be valid" do
    assert @manage.valid?
  end


end
