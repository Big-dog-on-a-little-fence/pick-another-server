require 'test_helper'

class CommentsHelperTest < ActionDispatch::IntegrationTest

  test "comments count" do
    assert_equal 2, Comment.count
  end

  # test "should get commentable" do
  #   @comment = comments(:two)
  #   assert_equal "Comment", @comment.commentable_type
  # end

  # test "should get first parent that is not a comment" do
  #   @comment = Comment.find(2)
  #   @parent = get_parent_commentable(@comment)
  #   assert_equal @parent, Tune.find(4)
  # end

end