require 'test_helper'

class ShopsShowTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @shop = shops(:ramen2)
  end
  
  test "shop-show interface" do
    get shop_path(@shop)
    assert_select "h1", "こんしんや"
    assert_select "h3", "「こんしんや」へのコメント"
    assert_match "ふつう", response.body
    assert_match "ログインしてコメントする", response.body
    assert_select "table"
  end
  
  test "shop-show interface with login" do
    log_in_as @user
    get shop_path(@shop)
    assert_select "h1", "こんしんや"
    assert_select "h3", "「こんしんや」へのコメント"
    assert_match "ふつう", response.body
    assert_select "div.field"
    assert_select "table"
  end
end
