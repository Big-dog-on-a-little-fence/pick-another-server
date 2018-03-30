require 'test_helper'

class TunesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in users(:alice)
    @tune = tunes(:one)
  end

  test "should get index" do
    get tunes_url
    assert_response :success
  end

  test "should get new" do
    get new_tune_url
    assert_response :success
  end

  test "should create tune" do
    assert_difference('Tune.count') do
      post tunes_url, params: { tune: { name: "New Boring Tune", key: "A" } }
    end

    assert_redirected_to tune_url(Tune.last)
  end

  test "should show tune" do
    get tune_url(@tune)
    assert_response :success
  end

  test "should get edit" do
    get edit_tune_url(@tune)
    assert_response :success
  end

  test "should update tune" do
    patch tune_url(@tune), params: { tune: { name: "Updated" } }
    assert_redirected_to tune_url(@tune)
  end

  # test "should not be allowed to destroy tune" do
  #   assert_raises(ActionController::RoutingError, NoMethodError) do
  #     delete tune_url(@tune)
  #   end
  # end
  
  teardown do
    sign_out :user
  end
end
