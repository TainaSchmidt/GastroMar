require "test_helper"

class PescadosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pescados_index_url
    assert_response :success
  end

  test "should get new" do
    get pescados_new_url
    assert_response :success
  end

  test "should get show" do
    get pescados_show_url
    assert_response :success
  end
end
