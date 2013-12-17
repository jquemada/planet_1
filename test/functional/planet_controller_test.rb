require 'test_helper'

class PlanetControllerTest < ActionController::TestCase
  test "should get author" do
    get :author
    assert_response :success
  end

end
