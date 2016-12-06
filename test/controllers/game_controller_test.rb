require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get results page" do
    get "/game/1/results"
    assert_response :success
  end
end
