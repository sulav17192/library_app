require "test_helper"

class RentalsControllerTest < ActionDispatch::IntegrationTest
  test "should get history" do
    get rentals_history_url
    assert_response :success
  end
end
