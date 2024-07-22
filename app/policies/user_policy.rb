# app/policies/user_policy.rb

class UserPolicy < ApplicationPolicy
  def show_photos?
    record == user ||
     !record.private? ||
     record.followers.include?(user)
  end

  def show?
    true
  end

  def feed?
    record == user
  end

  def discover?
    feed?
  end

  def liked?
    show?
  end
end
