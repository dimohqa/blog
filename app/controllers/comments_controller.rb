class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    fill_comment_fields(@post).save

    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    redirect_to controller: 'posts', action: 'show', id: @post.id
  end

  private def fill_comment_fields(post)
    @comment = post.comments.new(comment_params)
    @comment.author_id = current_user.id
    user = User.find(current_user.id)
    @comment.username = "#{user.firstName} #{user.lastName}"
    @comment
  end

  private def comment_params
    params.require(:comment).permit(:body)
  end
end
