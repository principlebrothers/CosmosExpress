class User < ApplicationRecord
  has_many :comments
  has_many :posts
  has_many :likes

  after_initialize :init

  def init
    self.posts_counter ||= 0
  end

  def recent_post
    posts.order(created_at: :desc).limit(3)
  end
end
