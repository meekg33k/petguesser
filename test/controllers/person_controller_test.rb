require 'test_helper'

class PersonControllerTest < ActionController::TestCase
  test "can create a new person record" do
    post :create, :person => { :name =>'Test name', :height => 5, :weight => 108}
    assert_response :redirect
  end
end
