require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get main" do
    get users_main_url
    assert_response :success
  end

  test "should get show" do
    get users_show_url
    assert_response :success
  end

end
