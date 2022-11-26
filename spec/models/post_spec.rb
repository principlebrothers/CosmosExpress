require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    author_one = User.create(name: 'Author One', photo: 'https://picsum.photos/200/300', bio: 'I am author one', posts_counter: 0)
    subject { Post.new(author: author_one, title: 'Post title', comments_counter: 5, likes_counter: 3) }

    before { subject.save }

    it 'title should be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title should not be longer than 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end

    it 'comments_counter should be positive integer' do
      subject.comments_counter = -1
      expect(subject).to_not be_valid
    end

    it 'likes_counter should be positive integer' do
      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end

    describe 'recent_comment' do
      before { 5.times { |comment| Comment.create(author: author_one, post: subject, text: "Comment #{comment}") } }

      it 'should return the 5 most recent comments' do
        expect(subject.recent_comments).to eq(subject.comments.last(5))
      end
    end
  end
end
