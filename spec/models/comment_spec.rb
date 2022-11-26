require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    author_one = User.create(name: 'Author One', photo: 'https://picsum.photos/200/300', bio: 'I am author one', posts_counter: 0)
    subject { Comment.new(author: author_one, post: Post.new(author: author_one, title: 'Post title', comments_counter: 5, likes_counter: 3), text: 'Comment text') }

    before { subject.save }

    it 'text should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end

    it 'post_id should be a number' do
      subject.post_id = '1'
      expect(subject).to_not be_valid
    end

    describe 'update_comments_counter' do
      it 'should increment comments_counter by 1' do
        expect { subject.update_comments_counter }.to change { subject.post.comments_counter }.by(1)
      end
    end
  end
end