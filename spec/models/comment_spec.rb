require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    Comment.new(author_id: 1, post_id: 1, text: 'Comment text')

    before { subject.save }

    it 'text should be present' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end
end
