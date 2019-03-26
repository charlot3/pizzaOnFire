require 'test_helper'

class MenuControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "PizzaExpress"
  end

  test "should get menu" do
    get menu_path
    assert_response :success
    assert_select "title", "Menu | #{@base_title}"
  end


end
