# app/policies/comment_policy.rb

class CommentPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    user == record.author
  end

  def destroy?
    update?
  end

end
