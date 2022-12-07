require 'rails_helper'

RSpec.describe 'UserIndex', type: :feature do
  before :each do
    @user_one = User.create(name: 'Frank', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Ghana.', posts_counter: 1)

    @user_two = User.create(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Ivory Cost.', posts_counter: 3)

    @users = [@user_one, @user_two]
  end

  it 'should shows all users' do
    visit root_path
    @users.each do |user|
      expect(page).to have_content(user.name)
    end
  end

  it 'it should show all users photo' do
    visit root_path
    @users.each do |user|
      expect(page).to have_css("img[src*='#{user.photo}']")
    end
  end

  it 'should show the number of posts of each user' do
    visit root_path
    @users.each do |user|
      expect(page).to have_content("Number of Posts: #{user.posts_counter}")
    end
  end

  it 'should redirect to the user show page when I click on a user' do
    visit root_path
    click_link(@user_one.name)
    expect(page).to have_current_path(user_path(@user_one))
  end
end