require 'test_helper'

class Public::ProjectsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
