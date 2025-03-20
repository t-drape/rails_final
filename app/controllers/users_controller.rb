class UsersController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @user = User.where(id: params[:id]).first
    @posts = Post.where(user_id: params[:id])
  end
end
