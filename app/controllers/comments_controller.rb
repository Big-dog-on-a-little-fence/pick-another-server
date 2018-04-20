class CommentsController < ApplicationController
  before_action :set_commentable, :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user
    if @comment.save
      redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: "Your comment wasn't posted"
    end
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end
  
  def update
    @comment = @commentable.comments.find(params[:id])
    redirection = nil
    if params[:url].present?
      redirection = Base64.decode64(params[:url].to_s)
    end
    if @comment.update(comment_params)
      if redirection.present?
        redirect_to redirection, notice: "Your comment was succesfully updated"
      else
        redirect_to root_path
      end
    else
      link_to :back, notice: "Your comment was not updated"
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    redirection = nil
    if params[:url].present?
      redirection = Base64.decode64(params[:url].to_s)
    end
    if @comment.comments.empty? and (@comment.user == current_user)
      @comment.destroy
      if redirection.present?
        redirect_to redirection, notice: "Your comment was succesfully deleted"
      else
        redirect_to root_path
      end
    else
      redirect_to :back, notice: "Comment was not deleted"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Jam.find_by_id(params[:jam_id]) if params[:jam_id]
    @commentable = Tune.find_by_id(params[:tune_id]) if params[:tune_id]
  end
end