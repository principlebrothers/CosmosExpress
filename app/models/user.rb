class User < ApplicationRecord
  has_many :comments, foreign_key: 'author_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes,foreign_key: 'author_id'

  after_initialize :init

  def init
    self.posts_counter ||= 0
  end

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
