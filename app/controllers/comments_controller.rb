class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.username = current_user.id

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  private def comment_params
    params.require(:comment).permit(:body)
  end
end
