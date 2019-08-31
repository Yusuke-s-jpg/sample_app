class PostsController < ApplicationController
  def new
  end

  def create
    @post = Post.new(
      title: params[:title],
      content: params[:content],
      user_id: @current_user.id
    )
    @post.save
    @post.photo_name = "#{@post.id}.jpg"
    image = params[:photo]
      File.binwrite("public/post_photo/#{@post.photo_name}", image.read)
    redirect_to("/")
  end

  def show
    @post = Post.find_by(id: params[:id])
  end
end
