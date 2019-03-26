require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "PizzaExpress"
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get menu" do
    get menutmp_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get factory" do
    get factory_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get manage" do
    get  manage_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end
end
