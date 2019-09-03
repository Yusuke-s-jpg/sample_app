class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = Post.where(user_id: @user.id).page(params[:page]).per(4).order(created_at: :desc)
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

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:name]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.image_name = "#{@user.id}.jpg"
    @user.save
    image = params[:photo]
    if image
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    redirect_to("/users/#{@user.id}")
    else
      @error_message = "※"
      render("users/edit")
    end
  end

  def delete
    @user = User.find_by(id: params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to("/")
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
