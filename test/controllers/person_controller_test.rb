require 'test_helper'

class PersonControllerTest < ActionController::TestCase
  test "can create a new person record" do
    post :create,
      params: { person: { name: "Test name", height: 5.5, weight: 108}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Title:\n  can create"
  end
end
