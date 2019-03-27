require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users (:michael)
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:
                                              @user.email,
                                          password: 'password' }}
    assert_redirected_to user_url(@user)
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 1
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    assert is_logged_in?
  end
end
