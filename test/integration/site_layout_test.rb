require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", menu_path
    assert_select "a[href=?]", orders_new_path
    assert_select "a[href=?]", manage_new_path
  end


end
