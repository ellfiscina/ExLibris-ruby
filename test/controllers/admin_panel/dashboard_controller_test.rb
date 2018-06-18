require 'test_helper'

class AdminPanel::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_panel_dashboard_index_url
    assert_response :success
  end

end
