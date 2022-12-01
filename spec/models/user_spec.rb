require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { User.new(name: 'Ernesto', photo: 'myphoto.jpg', bio: 'I am a software developer') }

    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'posts_counter should be positive integer' do
      subject.posts_counter = -1
      expect(subject).to_not be_valid
    end

    describe 'recent_post' do
      before { 5.times { |post| Post.create(author: subject, title: "Post #{post}") } }

      it 'should return the 3 most recent posts' do
        expect(subject.recent_post).to eq(subject.posts.order(created_at: :desc).limit(3))
      end
    end
  end
end
