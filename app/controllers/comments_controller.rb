class CommentsController < ApplicationController
  def create
    # remember to refer to the post id here
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    # same path we're on, just with the updated post
    redirect_to post_path(@post)
  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
