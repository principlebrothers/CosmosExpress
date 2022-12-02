class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts[params[:id].to_i - 1]
    @post_id = @post.id
  end
end
