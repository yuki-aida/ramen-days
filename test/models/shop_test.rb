require 'test_helper'

class ShopTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    
    @shop = Shop.create(name: "ramen", adress: "ramen", area: "ramen", station: "ramen",
                tel: "ramen", business_hour: "ramen", holiday: "ramen", access: "ramen",
                )
  end
  
  test "should be valid" do
    assert @shop.valid?
  end
  
  test "content should be present" do
    @shop.adress = " "
    assert_not @shop.valid?
  end
  
  test "name should be at most 40 characters" do
    @shop.name = "a" * 41
    assert_not @shop.valid?
  end
end
