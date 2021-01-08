class PostPolicy
  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def update?
    if user.present? || !post
      true
    else
      raise Pundit::NotAuthorizedError, "Вы не авторизованы, невозможно обновить #{@post.inspect}"
    end
  end

  def destroy?
    if user.present? || !post
      true
    else
      raise Pundit::NotAuthorizedError, "Вы не авторизованы, невозможно удалить #{@post.inspect}"
    end
  end

  def edit?
    if user.present? || !post
      true
    else
      raise Pundit::NotAuthorizedError, "Вы не авторизованы, невозможно изменить #{@post.inspect}"
    end
  end
end