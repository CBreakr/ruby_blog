class PostsController < ApplicationController
  ###
  # list all posts
  def index
    @posts = Post.all
  end

  ###
  # show individual post
  def show
    # pass in the ID to get the particular form
    @post = Post.find(params[:id])
  end

  ###
  # new post form
  def new
    @post = Post.new
  end

  ###
  # action on new post submit
  def create
    # just to show that the submission routes to this method
    #render plain: params[:post].inspect;

    # actually create the new post in the DB
    @post = Post.new(post_params)

    if(@post.save)
      redirect_to @post
    else
      render "new"
    end
  end

  ###
  # edit post form
  def edit
    @post = Post.find(params[:id])
  end

  ###
  # action on post update
  def update
    @post = Post.find(params[:id])
    if(@post.update(post_params))
      redirect_to @post
    else
      render "edit"
    end
  end

  ###
  # need to specify the fields
  # otherwise it'll throw an error
  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
