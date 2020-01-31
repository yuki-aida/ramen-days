require 'test_helper'

class LikesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @shop = shops(:ramen1)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Like.count' do
      post likes_path, params: { shop_id: @shop.id, user_id: @user.id }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Like.count' do
      delete like_path(@shop.id)
    end
    assert_redirected_to login_url
  end
  
end