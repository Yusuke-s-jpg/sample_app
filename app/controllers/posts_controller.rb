class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(title: params[:title], content: params[:content])
    @post.save
    redirect_to("/")
  end
end
