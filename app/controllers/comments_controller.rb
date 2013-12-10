class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    
    if @comment.save
      flash[:notice] = "Comment added"
      redirect_to post_path(@post)
    else
      flash[:error] = @comment.errors
      render 'posts/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end


end