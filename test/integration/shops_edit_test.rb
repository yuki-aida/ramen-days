require 'test_helper'

class ShopsEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    @shop = shops(:ramen1)
    log_in_as(@user)
  end
  
  test "unsuccessful shop-edit" do
    get edit_shop_path(@shop)
    assert_template 'shops/edit'
    patch shop_path(@shop), params: { shop: { name:  "",
                                         adress: "",
                                         area:              "foo",
                                         station: "bar", tel: "", business_hour: "",
                                         holiday: "", access: ""} }
    assert_template 'shops/edit'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end
  
  test "successful shop-edit" do
    get edit_shop_path(@shop)
    assert_template 'shops/edit'
    patch shop_path(@shop), params: { shop: { name:  "ramen",
                                        adress: "ramen",
                                        area: "ramen",
                                        station: "ramen",
                                        tel: "ramen",
                                        business_hour: "ramen",
                                        holiday: "ramen",
                                        access: "ramen" } }
    assert_not flash.empty?
    assert_redirected_to @shop
    @shop.reload
    assert_equal "ramen",  @shop.name
    assert_equal "ramen", @shop.adress
  end
  
  test "shop delete" do
    get edit_shop_path(@shop)
    assert_template 'shops/edit'
    assert_difference 'Shop.count', -1 do
      delete shop_path(@shop)
    end
    assert_redirected_to root_url
  end
  
end
