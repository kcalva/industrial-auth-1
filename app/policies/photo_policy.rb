# app/policies/photo_policy.rb

class PhotoPolicy < ApplicationPolicy
  # Our policy is that a photo should only be seen by the owner or followers
  #   of the owner, unless the owner is not private in which case anyone can
  #   see it
  def show?
    user == record.owner ||
      !record.owner.private? ||
      record.owner.followers.include?(user)
  end

  def create?
    !user.nil?
  end

  def update?
    user == record.owner
  end

  def destroy?
    update?
  end

end
