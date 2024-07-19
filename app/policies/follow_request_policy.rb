# app/policies/comment_policy.rb

class FollowRequestPolicy < ApplicationPolicy
  # attr_reader :user, :follow_request

  # def initialize(user, follow_request)
  #   @user = user
  #   @follow_request = follow_request
  # end

  def show?
    user == record.recipient
  end

  def create?
    true
  end

  def edit?
    user == record.recipient || user == record.sender
  end

  def destroy?
    edit?
  end

  def update?
    edit?
  end

end
