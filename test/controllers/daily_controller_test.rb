require 'test_helper'

class DailyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_index_url
    assert_response :success
  end

end
