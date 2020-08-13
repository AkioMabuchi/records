require 'test_helper'

class PsyberZoneControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get psyber_zone_index_url
    assert_response :success
  end

  test "should get show" do
    get psyber_zone_show_url
    assert_response :success
  end

end
