class PostsController < ApplicationController
  before_action :ensure_correct_user, {only: [:edit, :update, :delete]}

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
    if image
      File.binwrite("public/post_photos/#{@post.photo_name}", image.read)
    flash[:notice] = "You created a new post successfully"
    redirect_to("/")
    else
     @error_message = "※"
     render("posts/edit")
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title]
    @post.content = params[:content]
    @post.save
    @post.photo_name = "#{@post.id}.jpg"
    image = params[:photo]
    if image
      File.binwrite("public/post_photos/#{@post.photo_name}", image.read)
    flash[:notice] = "You succeeded in update"
    redirect_to("/users/#{@current_user.id}")
    else
      @error_message = "※"
      render("posts/edit")
    end
  end

  def delete
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "You succeeded in delete"
    redirect_to("/users/#{@current_user.id}")
  end

  def ensure_correct_user
   @post = Post.find_by(id: params[:id])
   if @current_user.id !=  @post.user_id
     flash[:notice] = "You are not authorized to access this page"
     redirect_to("/")
   end
  end

end
