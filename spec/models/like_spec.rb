require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'validations' do
    subject { Like.new(author_id: 1, post_id: 1) }

    it 'autho_id should be present' do
      subject.author_id = nil
      expect(subject).to_not be_valid
    end

    it 'post_id should be present' do
      subject.post_id = nil
      expect(subject).to_not be_valid
    end

    it 'post_id should be integer' do
      subject.post_id = '1'
      expect(subject).to_not be_valid
    end
  end
end
