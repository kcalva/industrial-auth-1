# app/policies/user_policy.rb

class UserPolicy < ApplicationPolicy
  # attr_reader :current_user, :user

  # def initialize(current_user, user)
  #   @current_user = current_user
  #   @user = user
  # end

  def show?
    record == user ||
     !record.private? ||
     record.followers.include?(user)
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
