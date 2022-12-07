require "rails_helper"

RSpec.describe "PostShow", type: :feature do
  before :each do
    @user_one = User.create(name: "Frank", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Ghana.", posts_counter: 2)

    @user_two = User.create(name: "John", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Ivory Cost.", posts_counter: 3)

    @first_post = Post.create(author: @user_one, title: 'Hello', text: 'This is my first post', comments_counter: 3, likes_counter: 2)

    @second_post = Post.create(author: @user_one, title: 'Second', text: 'This is my second post', comments_counter: 1, likes_counter: 2)

    @third_post = Post.create(author: @user_one, title: 'Third', text: 'This is my third post', comments_counter: 2, likes_counter: 1)

    @first_comment = Comment.create(post: @first_post, author: @user_one, text: 'Hi Tom!')

    @user_posts = @user_one.posts
  end

  describe "Post show page features" do
    before :each do
      visit user_post_path(@user_one, @first_post)
    end

    it "should show the post's title and post author" do
      expect(page).to have_content(@first_post.title)
      expect(page).to have_content(@first_post.author.name)
    end

    it "should show the number of comments and likes" do
      expect(page).to have_content("Comments: #{@first_post.comments_counter}")
      expect(page).to have_content("Likes: #{@first_post.likes_counter}")
    end

    it "should show the post's text" do
      expect(page).to have_content(@first_post.text)
    end

    it "should show the user who wrote the comment" do
      expect(page).to have_content(@first_comment.author.name)
    end

    it "should show the comments" do
      expect(page).to have_content(@first_comment.text)
    end
  end
end

