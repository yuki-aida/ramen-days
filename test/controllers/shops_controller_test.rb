require 'test_helper'

class ShopsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @shop = shops(:ramen1)
    @user = users(:michael)
  end
  
  test "should get index" do
    get shops_path
    assert_response :success
  end

  test "should get show" do
    get shop_path(@shop)
    assert_response :success
  end

  test "should get edit" do
    log_in_as(@user)
    get edit_shop_path(@shop)
    assert_response :success
  end

  test "should get new" do
    log_in_as(@user)
    get new_shop_path(@shop)
    assert_response :success
  end

end
