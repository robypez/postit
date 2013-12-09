class CommentsController < ApplicationController

  def new
    @comment = Comment.new
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

  # def edit
  #   @post  = Post.find(params[:id])
  #   render 'edit'
  # end

  # def update
  #   @post = Post.find(params[:id])
  #   if @post.update_attributes(post_params)
  #     flash[:notice] = "Post updated"
  #     redirect_to post_path(@post)
  #   else
  #     flash[:error] = @post.errors
  #     render 'edit'
  #   end

  # end

  # private

  # def post_params
  #   params.require(:post).permit(:title, :url, :description)
  # end


end
