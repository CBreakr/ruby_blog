class PostsController < ApplicationController
  http_basic_authenticate_with name: "RobNot",
  password: "112358",
  except: [:index, :show]

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
  # delete post from the DB
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  ###
  # need to specify the fields
  # otherwise it'll throw an error
  private def post_params
    params.require(:post).permit(:title, :body)
  end
end
