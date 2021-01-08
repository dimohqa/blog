class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    return true if user.present?

    raise Pundit::NotAuthorizedError, "You are not logged in, it is impossible to update #{@post.inspect}"
  end

  def destroy?
    return true if user.present?

    raise Pundit::NotAuthorizedError, "You are not logged in, it is impossible to delete #{@post.inspect}"
  end

  def edit?
    return true if user.present?

    raise Pundit::NotAuthorizedError, "You are not logged in, it is impossible to edit #{@post.inspect}"
  end

  def create?
    return true if user.present?

    raise Pundit::NotAuthorizedError, 'You are not logged in, it is impossible to create post'
  end

  def myposts?
    return true if user.present?

    raise Pundit::NotAuthorizedError, 'You are not logged in, your posts cannot be displayed'
  end

  def new?
    return true if user.present?

    raise Pundit::NotAuthorizedError, 'You are not logged in, your posts cannot be create'
  end
end
