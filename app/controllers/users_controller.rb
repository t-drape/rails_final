class UsersController < ApplicationController
  def index
    @users = User.all.where.not(id: current_user.id)
  end

  def show
    @user = User.where(id: params[:id]).first
    @posts = Post.where(user_id: params[:id])
    @follow = Follow.new
    @influencers = @user.influencers[0..5]
    @liked = @user.liked_posts
  end
end
