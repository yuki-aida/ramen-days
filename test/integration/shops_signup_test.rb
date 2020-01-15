require 'test_helper'

class ShopsSignupTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
    log_in_as(@user)
  end
  
  test "invalid shops-signup" do
    get new_shop_path
    assert_no_difference 'Shop.count' do
      post shops_path, params: { shop: { name:  "",
                                         adress: "",
                                         area:              "foo",
                                         station: "bar", tel: "", business_hour: "",
                                         holiday: "", access: ""} }
    end
    assert_template 'shops/new'
    assert_select 'div#error_explanation'
    assert_select 'div.alert-danger'
  end
  
  test "valid shops-signup" do
    get new_shop_path
    assert_difference 'Shop.count', 1 do
      post shops_path, params: { shop: { name:  "ramen",
                                        adress: "ramen",
                                        area: "ramen",
                                        station: "ramen",
                                        tel: "ramen",
                                        business_hour: "ramen",
                                        holiday: "ramen",
                                        access: "ramen" } }
    end
    follow_redirect!
    assert_template 'shops/show'
    assert_not flash.empty?
  end
  
end
