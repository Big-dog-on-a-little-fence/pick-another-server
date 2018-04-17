class CommentsController < ApplicationController
  before_action :find_commentable, :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params.merge(user_id: current_user.id)

    if @comment.save
      redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: "Your comment wasn't posted"
    end
  end

  def destroy
    if @commentable.comments.empty? and (@commentable.user_id == current_user)
      @commentable.destroy
      redirect_to :back, notice: "Your comment was deleted"
    else
      redirect_to :back, notice: "Comment was not deleted"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Tune.find_by_id(params[:tune_id]) if params[:tune_id]
  end
end