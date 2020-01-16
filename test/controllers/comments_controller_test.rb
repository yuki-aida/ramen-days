require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @comment = comments(:michael_comment)
  end
  
  test "should redirect create when not logged in" do
    assert_no_difference 'Comment.count' do
      post comments_path, params: { comment: { content: "うまい！" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Comment.count' do
      delete comment_path(@comment)
    end
    assert_redirected_to login_url
  end
  
  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    comment = comments(:ants_comment)
    assert_no_difference 'Comment.count' do
      delete comment_path(comment)
    end
    assert_redirected_to root_url
  end

end
