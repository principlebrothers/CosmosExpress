# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can [:read, :create], Post
    can [:read, :create], Comment
    can [:create], Like
    can [:update, :destroy], Post, author_id: user.id
    can [:update, :destroy], Comment, author_id: user.id

    return unless user.role == 'admin'
    can :manage, :all
  end
end
