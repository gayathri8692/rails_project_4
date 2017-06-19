require 'test_helper'

class AllPicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get all_pics_index_url
    assert_response :success
  end

end
