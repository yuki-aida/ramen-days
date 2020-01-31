require 'test_helper'

class ShopsIndexTest < ActionDispatch::IntegrationTest
  test "shop-index interface" do
    get shops_path
    assert_match "ラーメン1号", response.body
    assert_match "こんしんや", response.body
    assert_match "やまおかや", response.body
  end
end
