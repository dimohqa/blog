class PostsController < ApplicationController
  def index
    @posts = Post.all.sort_by { |post| Date.strptime(post.created_at.to_s, '%Y-%m-%d') }
  end

  def show
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    @post.destroy

    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    authorize Post
    if params[:new_draft]
      @draft = Draft.new(post_params)
      save(@draft, drafts_path, 'new')
    else
      @post = Post.new(post_params)
      save(@post, @post, 'new')
    end
  end

  def myposts
    @posts = Post.where(user_id: current_user.id)
    authorize @posts
  end

  def up_rate_post
    post = Post.find(params[:post_id])
    user_id = current_user.id

    if post.up_rate.include?(user_id)
      nil
    else
      post.down_rate.delete(user_id) if post.down_rate.include?(user_id)
      post.up_rate.push(user_id)
    end

    post.save
    redirect_to post, notice: 'Действие успешно выполнено.'
  end

  def down_rate_post
    post = Post.find(params[:post_id])
    user_id = current_user.id

    if post.down_rate.include?(user_id)
      nil
    else
      post.up_rate.delete(user_id) if post.up_rate.include?(user_id)
      post.down_rate.push(user_id)
    end

    post.save
    redirect_to post, notice: 'Действие успешно выполнено.'
  end

  def post_params
    req_body = params.require(:post).permit(:title, :body)
    req_body[:user_id] = current_user.id

    req_body
  end

  def new
    authorize Post
    @post = Post.new
  end

  def save(model, redirect_from, else_redirect_from)
    if model.save
      redirect_to redirect_from
    else
      render else_redirect_from
    end
  end
end
