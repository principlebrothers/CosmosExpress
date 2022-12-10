class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_create :update_comments_counter

  validates :text, presence: true

  def update_comments_counter
    post.update(comments_counter: post.comments.size)
  end

end
