class PostsPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    user.present?
  end

  def update?
    return true if user.present? && user == current_user.id
  end

  def destroy?
    return true if user.present? && user == current_user.id
  end

  private

  def article
    record
  end
end
