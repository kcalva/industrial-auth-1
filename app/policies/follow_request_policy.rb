# app/policies/follow_request_policy.rb

class FollowRequestPolicy < ApplicationPolicy
  def show?
    user == record.recipient
  end

  def create?
    true
  end

  def update?
    user == record.recipient || user == record.sender
  end

  def destroy?
    update?
  end

end
