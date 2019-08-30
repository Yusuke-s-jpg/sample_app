class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      image_name: "defoult_image.jpg"
    )
    if @user.save
    session[:user_id] = @user.id
    redirect_to("/")
    end
  end

  def login
    @user = User.find_by(
      email: params[:email],
      password: params[:password]
    )
    if @user
      session[:user_id] = @user.id
      redirect_to("/")
    else
      @error_message = "We couldn't search for your email or password"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/")
  end

  def login_form
  end
end
