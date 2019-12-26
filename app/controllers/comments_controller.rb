class CommentsController < ApplicationController

  ###
  # action on new comment submit
  def create
    # remember to refer to the post id here
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    # same path we're on, just with the updated post
    redirect_to post_path(@post)
  end

  ###
  # delete comment from the DB
  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  ###
  # need to specify the fields
  # otherwise it'll throw an error
  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
