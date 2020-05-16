require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get sign up" do
    get sign_up_path
    assert_response :success
  end

end
