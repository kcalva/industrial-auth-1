# app/policies/comment_policy.rb

class CommentPolicy < ApplicationPolicy
  # attr_reader :user, :comment

  # def initialize(user, comment)
  #   @user = user
  #   @comment = comment
  # end

  def edit?
    user == record.author
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

  def create?
    true
  end

end
