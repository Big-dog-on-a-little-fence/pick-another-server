module CommentsHelper
  
  def get_parent_commentable(comment)
    # get the first non-comment commentable (e.g. - Tune or Jam)
    if comment.commentable.class.name == "Comment"
      get_parent_commentable(comment.commentable)
    else
      return comment.commentable
    end
  end

end
