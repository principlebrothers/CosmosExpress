require "rails_helper"

RSpec.describe "PostIndex", type: :feature do
  before :each do
    @user_one = User.create(name: "Frank", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Ghana.", posts_counter: 2)

    @user_two = User.create(name: "John", photo: "https://unsplash.com/photos/F_-0BxGuVvo", bio: "Teacher from Ivory Cost.", posts_counter: 3)

    @first_post = Post.create(author: @user_one, title: 'Hello', text: 'This is my first post', comments_counter: 3, likes_counter: 2)

    @second_post = Post.create(author: @user_one, title: 'Second', text: 'This is my second post', comments_counter: 1, likes_counter: 2)

    @third_post = Post.create(author: @user_one, title: 'Third', text: 'This is my third post', comments_counter: 2, likes_counter: 1)

    @first_comment = Comment.create(post: @first_post, author: @user_one, text: 'Hi Tom!' )

    @user_posts = @user_one.posts
  end

  describe "Post index page features" do
    before :each do
      visit user_posts_path(@user_one.id, @user_posts)
    end

    it "should show the user's profile picture" do
      expect(page).to have_css("img[src*='#{@user_one.photo}']")
    end

    it "should show the user's name" do
      expect(page).to have_content(@user_one.name)
    end

    it 'should show the number of posts of the user one' do
      expect(page).to have_content("Number of Posts: #{@user_one.posts_counter}")
    end

    it "should show the user's first three posts" do
      @user_posts.each do |post|
        expect(page).to have_content(post.title)
        expect(page).to have_content(post.text)
      end
    end

    it "should show the first comment on a post" do
      expect(page).to have_content(@first_comment.text)
    end

    it "should show the number of comments on each post" do
      @user_posts.each do |post|
        expect(page).to have_content("Comments: #{post.comments_counter}")
      end
    end

    it "should show the number of likes each post has" do
      @user_posts.each do |post|
        expect(page).to have_content("Likes: #{post.likes_counter}")
      end
    end

    it "should show if pagination exit" do
      expect(page).to have_css('.pagination')
    end

    it "should redirect to the post show page when a post is clicked" do
      click_link(@first_post.title)
      expect(page).to have_current_path(user_post_path(@user_one.id, @first_post.id))
    end
  end
end
