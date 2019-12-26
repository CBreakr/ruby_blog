class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new

  end

  def show
    # pass in the ID
    @post = Post.find(params[:id])
  end

  def create
    # just to show that the submission
    # routes to this method
    #render plain: params[:post].inspect;

    # actually create the new post in the DB
    @post = Post.new(post_params)
    @post.save
    redirect_to @post
  end

  private def post_params
    # need to specify the fields
    # otherwise it'll throw an error
    params.require(:post).permit(:title, :body)
  end
end
