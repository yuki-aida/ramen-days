require 'test_helper'

class ShopsSearchTest < ActionDispatch::IntegrationTest
  
  test "micropost feed search" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "input[type=submit]"
    assert_select "input[type=search]"
    get "/search", params: { search: "ラーメン" }
    assert_template 'search'
    assert_match "ラーメン1号", response.body
    assert_no_match "こんしんや", response.body
    get "/search", params: { search: "こんしんや" }
    assert_match "こんしんや", response.body
    assert_no_match "ラーメン1号", response.body
  end
  
end
