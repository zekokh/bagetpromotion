require 'test_helper'

class PromocodControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get promocod_index_url
    assert_response :success
  end

  test "should get searche" do
    get promocod_searche_url
    assert_response :success
  end

end
