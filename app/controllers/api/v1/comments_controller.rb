class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.where(post_id: params[:post_id])
    if @comments.empty?
      render json: { error: 'No comments found' }
    else
      render json: @comments
    end
  end

  def new
    render json: Comment.new
  end

  def create
    comment = Comment.new(comment_params)
    if comment.save
      render json: comment
    else
      render json: comment.errors
    end
  end

  def comment_params
    params.require(:comment).permit(:text, :author_id, :post_id)
  end
end
