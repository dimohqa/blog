class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    return if user.present?

    raise Pundit::NotAuthorizedError, "You are not logged in, it is impossible to update #{@post.inspect}"
  end

  def destroy?
    return if user.present?

    raise Pundit::NotAuthorizedError, "You are not logged in, it is impossible to delete #{@post.inspect}"
  end

  def edit?
    return if user.present?

    raise Pundit::NotAuthorizedError, "You are not logged in, it is impossible to edit #{@post.inspect}"
  end

  def create?
    return if user.present?

    raise Pundit::NotAuthorizedError, 'You are not logged in, it is impossible to create post'
  end

  def myposts?
    return if user.present?

    raise Pundit::NotAuthorizedError, 'You are not logged in, your posts cannot be displayed'
  end
end
