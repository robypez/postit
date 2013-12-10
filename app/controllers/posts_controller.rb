class PostsController < ApplicationController
  before_action :set_post, except: [ :index, :new, :create ]

  def index
    @title = "All posts"
    @posts = Post.all

    respond_to do |format|
      format.html
      format.yaml { render text:@posts.to_yaml }
      format.json { render text:@posts.to_json }
    end
  end

  def show
    @comment = Comment.new(post: @post)
    @comments = @post.comments.order(created_at: :desc)

    respond_to do |format|
      format.html
      format.yaml { render text:@post.to_yaml }
    end
  end

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
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
    @categories = Category.all
    render 'edit'
  end

  def update
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
    params.require(:post).permit(:title, :url, :description, {:category_ids =>[]})
  end

  def set_post 
    @post  = Post.find(params[:id])
  end


end
