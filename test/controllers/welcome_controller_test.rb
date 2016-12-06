require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  test "should get index page" do
    get :index
    assert_response :success
  end
  
  test "should get returning page" do
    get :returning
    assert_response :success
  end
end
