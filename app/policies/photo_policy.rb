# app/policies/photo_policy.rb

class PhotoPolicy < ApplicationPolicy
  # attr_reader :user, :photo

  # def initialize(user, photo)
  #   @user = user
  #   @photo = photo
  # end

  # Our policy is that a photo should only be seen by the owner or followers
  #   of the owner, unless the owner is not private in which case anyone can
  #   see it
  def show?
    user == record.owner ||
      !record.owner.private? ||
      record.owner.followers.include?(user)
  end

  def new?
    !user.nil?
  end

  def create?
    new?
  end

  def edit?
    user == record.owner
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end

end
