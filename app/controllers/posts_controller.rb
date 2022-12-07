class PostsController < ApplicationController
  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @all_posts = @user.posts.paginate(page: params[:page], per_page: 3)
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post was successfully created.'
          redirect_to user_post_path(current_user, @post)
        else
          flash.now[:error] = 'Post was not created.'
          render :new
        end
      end
    end
  end

  private

  def post_params
    params.require(:new_post).permit(:title, :text)
  end
end
