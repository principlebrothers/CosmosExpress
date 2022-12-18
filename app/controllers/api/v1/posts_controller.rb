class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.where(author_id: current_user.id)
    if posts.empty?
      render json: { error: 'No posts found' }
    else
      render json: posts
    end
  end

  def show
    specific_post = Post.find(params[:id])
    if specific_post.nil?
      json_response({ error: 'No post found' }, :not_found)
    else
      render json: specific_post
    end
  end
end
