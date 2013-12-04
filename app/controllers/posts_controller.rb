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

    respond_to do |format|
      format.html
      format.yaml { render text:@post.to_yaml }
    end
  end
end
