require 'test_helper'

class AdminPanel::DiagramsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_panel_diagrams_index_url
    assert_response :success
  end

end
