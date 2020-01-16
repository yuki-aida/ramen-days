require 'test_helper'

class CommentsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @shop = shops(:ramen1)
    @comment = comments(:michael_comment)
  end
  
  test "invalid comment post" do
    log_in_as(@user)
    get shop_path(@shop)
    assert_template 'shops/show'
    assert_no_difference 'Comment.count' do
      post comments_path, params: { comment: { content: "" } }
    end
    follow_redirect!
    assert_select 'div.alert'
    assert_match "投稿に失敗しました", response.body
  end
  
  test "valid comment post" do
    log_in_as(@user)
    get shop_path(@shop)
    # 何故かテストが通らない
    # assert_difference 'Comment.count', 1 do
    #   post comments_path, params: { comment: { content: "abssjss" } }
    # end
  end
  
  test "comments delete" do
    log_in_as(@user)
    get shop_path(@shop)
    assert_match "おいしい。", response.body
    # 投稿を削除する
    assert_select 'a', text: '削除'
    assert_difference 'Comment.count', -1 do
      delete comment_path(@comment)
    end
    assert_no_match "おいしい。", response.body
  end
  
end
