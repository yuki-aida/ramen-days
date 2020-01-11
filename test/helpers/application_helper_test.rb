require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
    test "full_title_helper" do
        assert_equal full_title, "Ramen Days"
        assert_equal full_title("About"), "About | Ramen Days"
    end
end