class PostsController < ApplicationController
  def index
    @posts = Post.all
    @posts.each do |post|
      post[:author] = User.find(post.author).email
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])

    @post.destroy

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user.id
    if @post.save
      redirect_to @post
    else
      render "new"
    end
  end

  def myposts
    @posts = Post.where(author: current_user.id)
  end

  def up_rate_post
    post = Post.find(params[:id])
    user_id = current_user.id.to_s

    if post.up_rate.include?(user_id)
      nil
    else
      if post.down_rate.include?(user_id)
        post.down_rate.delete(user_id)
      end
      post.up_rate.push(user_id)
    end

    post.save
    redirect_to post, notice: "Действие успешно выполнено."
  end

  def down_rate_post
    post = Post.find(params[:id])
    user_id = current_user.id.to_s

    if post.down_rate.include?(user_id)
      nil
    else
      if post.up_rate.include?(user_id)
        post.up_rate.delete(user_id)
      end
      post.down_rate.push(user_id)
    end

    post.save
    redirect_to post, notice: "Действие успешно выполнено."
  end

  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
