class HomeController < ApplicationController
  def top
    @posts = Post.all.page(params[:page]).per(4).order(created_at: :desc)
  end
end
