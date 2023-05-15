require "test_helper"

class AssassinsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assassins_index_url
    assert_response :success
  end
end
