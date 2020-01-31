require 'test_helper'

class LikeTestTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @shop = shops(:ramen1)
  end
  
  test "iine following by uniine" do
    log_in_as(@user)
    get shop_path(@shop)
    assert_select "input[type=submit]"
    assert_match "お気に入りに登録", response.body
    assert_difference 'Like.count', 1 do
      post likes_path, params: { shop_id: @shop.id }
    end
    assert_not flash.empty?
    assert_difference 'Like.count', -1 do
      like = Like.find_by(user_id: @user.id, shop_id: @shop)
      delete like_path(like.id)
    end
    assert_not flash.empty?
  end
  
  test "user's favorite shops" do
    log_in_as(@user)
    get '/likes'
    assert_template 'shops/likes'
    assert_no_match 'ラーメン1号', response.body
    assert_difference 'Like.count', 1 do
      post likes_path, params: { shop_id: @shop.id }
    end
    get '/likes'
    assert_match 'ラーメン1号', response.body
  end
  
end
