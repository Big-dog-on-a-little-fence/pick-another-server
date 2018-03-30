require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @user = users(:alice) # non-admin user
    sign_in @user
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  # test "should update user" do
  #   patch user_url(@user), params: { user: { username: "NotAlice" } }
  #   assert_redirected_to user_url(@user)
  # end

  test "should not destroy user if not admin" do
    assert_difference('User.count', 0) do
      delete user_url(@user)
    end

    assert_redirected_to root_url
  end

  test "should destroy user if admin" do
    sign_out :user
    sign_in users(:adminuser)
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end

  teardown do
    sign_out :user
  end
end
