require 'test_helper'

class PirateControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get build" do
    get :build
    assert_response :success
  end

end
