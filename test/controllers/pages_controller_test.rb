require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get bio" do
    get :bio
    assert_response :success
  end

  test "should get platform" do
    get :platform
    assert_response :success
  end

  test "should get issues" do
    get :issues
    assert_response :success
  end

  test "should get donate" do
    get :donate
    assert_response :success
  end

  test "should get share" do
    get :share
    assert_response :success
  end

end
