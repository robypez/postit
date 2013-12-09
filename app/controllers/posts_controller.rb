class PostsController < ApplicationController
  def index
    @posts = Post.all

    respond_to do |format|
      format.html
      format.yaml { render text:@posts.to_yaml }
      format.json { render text:@posts.to_json }
    end
  end

  def show
    @post  = Post.find(params[:id])
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.yaml { render text:@post.to_yaml }
    end
  end

  def new
    @post = Post.new
  end

  def create
    binding.pry
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors
      render 'new'
    end
  end

  def edit
    @post  = Post.find(params[:id])
    render 'edit'
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Post updated"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors
      render 'edit'
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :description)
  end


end
