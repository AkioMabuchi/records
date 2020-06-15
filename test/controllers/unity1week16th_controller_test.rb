require 'test_helper'

class Unity1week16thControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get unity1week16th_index_url
    assert_response :success
  end

  test "should get show" do
    get unity1week16th_show_url
    assert_response :success
  end

end
